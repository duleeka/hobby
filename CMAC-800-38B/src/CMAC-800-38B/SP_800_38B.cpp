#include "stdafx.h"
#include <cstdint>
#include <openssl/aes.h>   
#include <openssl/des.h>
#include <memory>
#include <memory.h>

#include "SP_800_38B.h"

#ifdef AES
#define BLOCK_SIZE ( 16 )
#endif

#ifdef DES
#define BLOCK_SIZE ( 8 )
#endif


using namespace std;

#if BLOCK_SIZE == 16
static uint8_t Rb[ BLOCK_SIZE ] = {0x00, 0x00, 0x00, 0x00,
								   0x00, 0x00, 0x00, 0x00,
								   0x00, 0x00, 0x00, 0x00,
								   0x00, 0x00, 0x00, 0x87}	/* As per spec SP800-38B */; 
#elif BLOCK_SIZE == 8
static uint8_t Rb[ BLOCK_SIZE ] = {0x00, 0x00, 0x00, 0x00,
								   0x00, 0x00, 0x00, 0x1B}	/* As per spec SP800-38B */; 
#endif


static void encryptDES( uint8_t * key, uint8_t * plainText, uint8_t * cipherText)
{

    DES_cblock      encKey;
    DES_key_schedule schedule;

    memcpy( encKey, key,8);
    DES_set_odd_parity( &encKey );
    DES_set_key_checked( &encKey, &schedule );

	DES_ecb_encrypt((C_Block *)plainText,(C_Block *)cipherText, &schedule, DES_ENCRYPT);
}

static void decryptDES( uint8_t * key, uint8_t * plainText, uint8_t * cipherText)
{ 
    DES_cblock      decKey;
    DES_key_schedule schedule;

    memcpy( decKey, key,8);
    DES_set_odd_parity( &decKey );
    DES_set_key_checked( &decKey, &schedule );

	DES_ecb_encrypt((C_Block *)plainText,(C_Block *)cipherText, &schedule, DES_DECRYPT); 
}

static void encryptTDES(uint8_t * key1, uint8_t * key2, uint8_t * key3,
						uint8_t * plainText, uint8_t * cipherText)
{
	uint8_t interBlock1[8];
	uint8_t interBlock2[8];
	encryptDES(key1, plainText, interBlock1);
	decryptDES(key2, interBlock1, interBlock2);
	encryptDES(key3, interBlock2, cipherText);
}

static void decryptTDES(uint8_t * key1, uint8_t * key2, uint8_t * key3,
						uint8_t * cipherText, uint8_t * plainText)
{
	uint8_t interBlock1[8];
	uint8_t interBlock2[8];
	decryptDES(key3, cipherText, interBlock1);
	encryptDES(key2, interBlock1, interBlock2);
	decryptDES(key1, interBlock2, plainText);
}

static void encryptAES128(uint8_t * key, 
							uint8_t * plainText, 
							uint8_t * cipherText)
{
	if ( ( key != NULL) && ( plainText != NULL) && ( cipherText != NULL ) )
	{
		uint8_t cipherTextCopy[16];
		AES_KEY enc_key;
		memset(&enc_key, 0, sizeof(enc_key));
		AES_set_encrypt_key(key, 128, &enc_key);
		AES_ecb_encrypt(plainText, cipherTextCopy, &enc_key, AES_ENCRYPT);
		memcpy(cipherText, cipherTextCopy, sizeof (cipherTextCopy) );
	} 
}

//Shift the given data array by the number of bits specified by parameter "bits"
static void left_shift_block(uint8_t * block,
	uint8_t length,
	uint8_t bits)
{
	for (int32_t i = 0; i < (length - 1); i++)
	{
		block[i] = block[i] << bits;
		block[i] |= ((block[i + 1] & 0x80) >> 7);
	}
	block[length - 1] = (block[length - 1] << bits);
}

static void leftShiftBlock(uint8_t * block,
					   uint8_t length,
					   uint8_t bits)
{
	uint8_t i;
	for ( i = 0; i < (length - 1); i++ )
	{
		block[i] = block[i] << bits;
		block[i] |= (( block[i + 1] & 0x80 ) >> 7 );
	}
	block[length - 1] = ( block[length - 1] << bits );
}

static void xor_blocks(uint8_t * block1,
	uint8_t * block2,
	uint8_t * out,
	uint8_t length)
{
	if ((block1 != nullptr) && (block2 != nullptr) && (out != nullptr))
	{
		uint8_t i = 0;
		for (i = 0; i < length; i++)
		{
			out[i] = block1[i] ^ block2[i];
		}
	}
}

static void xorBlocks(uint8_t * block1, 
					  uint8_t * block2, 
					  uint8_t * out, 
					  uint8_t length)
{
	if ( ( block1 != NULL) && ( block2 != NULL) && ( out != NULL ) )
	{
		uint8_t i = 0;
		for ( i = 0; i < length; i++ )
		{
			out[i] = block1[i] ^ block2[i];
		}
	}
}

static int32_t generate_sub_keys(algorithm algo, keys * keys, const uint8_t block_size, uint8_t * subkey1, uint8_t * subkey2)
{
	int32_t result;
	if ((keys == nullptr) || (subkey1 == nullptr) || (subkey2 == nullptr)) {
		result = RESULT__ERR_INVALID_PARAM;
	} else if (!((algo == aes) || (algo == des))) {
		result = RESULT__ERR_INVALID_PARAM;
	} else {
		auto initial_vector_array = make_unique<uint8_t[]>(block_size);
		auto initial_vector = initial_vector_array.get();

		/* 1. Let L = CIPHK(0b). */
		memset(initial_vector, 0, block_size);
		
#ifdef AES
		encryptAES128(keys->aes128.key, initial_vector, subkey1);		
#endif

#ifdef DES
		encryptTDES(keys->des.key1, keys->des.key2, keys->des.key3, initial_vector, subkey1);
#endif

		/* 2. If MSB1(L) = 0, then K1 = L << 1;
		Else K1 = (L << 1) XOR Rb;
		*/

		if ((subkey1[0] & 0x80) != 0)
		{	// MSB1(L) is not 0
			left_shift_block(subkey1, block_size, 1);
			xorBlocks(Rb, subkey1, subkey1, block_size);
		}
		else
		{
			left_shift_block(subkey1, block_size, 1);
		}

		/* 3. If MSB1(K1) = 0, then K2 = K1 << 1;
		Else K2 = (K1 << 1) XOR Rb.
		*/
		memcpy(subkey2, subkey1, block_size);
		if ((subkey1[0] & 0x80) != 0)
		{	// MSB1(K1) is not 0
			left_shift_block(subkey2, block_size, 1);
			xorBlocks(Rb, subkey2, subkey2, block_size);
		}
		else
		{
			left_shift_block(subkey2, block_size, 1);
		}
		result = block_size;
	}
	return result;
}

#ifdef AES
static int8_t generateSubkeys(uint8_t * key, 
							  uint8_t * subKey1, 
							  uint8_t * subKey2)
#endif
#ifdef DES
static int8_t generateSubkeys(uint8_t * key1, uint8_t * key2, uint8_t * key3, 
					          uint8_t * subKey1, 
                              uint8_t * subKey2)
#endif
{
	int8_t subKeyLength = 0;
	do
	{
		uint8_t initialVector [ BLOCK_SIZE ];
#ifdef AES
		if ( ( key == NULL ) )
		{
			break;
		}
#endif

#ifdef DES
		if ( ( key1 == NULL ) || ( key2 == NULL ) || ( key3 == NULL ) )
		{
			break;
		}
#endif
		if ( ( subKey1 == NULL) || ( subKey2 == NULL ) )
		{
			break;
		}

		/* 1. Let L = CIPHK(0b). */
		memset( initialVector, 0, sizeof( initialVector ) );

#ifdef AES
		encryptAES128( key, initialVector, subKey1 );
#endif

#ifdef DES
		encryptTDES(key1, key2, key3, initialVector, subKey1);
#endif
		
		/* 2. If MSB1(L) = 0, then K1 = L << 1;
			  Else K1 = (L << 1) XOR Rb;
		*/
		
		if ( ( subKey1[0] & 0x80 ) != 0)
		{	// MSB1(L) is not 0
			leftShiftBlock( subKey1, BLOCK_SIZE, 1 );
			xorBlocks( Rb, subKey1, subKey1, BLOCK_SIZE );
		}  
		else
		{
			leftShiftBlock( subKey1, BLOCK_SIZE, 1 );
		}
		

		/* 3. If MSB1(K1) = 0, then K2 = K1 << 1;
			  Else K2 = (K1 << 1) XOR Rb.
		*/
		memcpy( subKey2, subKey1, BLOCK_SIZE );
		if ( ( subKey1[0] & 0x80 ) != 0)
		{	// MSB1(K1) is not 0
			leftShiftBlock( subKey2, BLOCK_SIZE, 1 );
			xorBlocks( Rb, subKey2, subKey2, BLOCK_SIZE );
		}
		else
		{
			leftShiftBlock( subKey2, BLOCK_SIZE, 1 );
		}
		

		subKeyLength = BLOCK_SIZE;
	} while ( 0 );
	return subKeyLength;
}

#ifdef AES
int8_t calculateMAC(uint8_t * key, 
						   uint8_t * payload, 
						   uint16_t  payloadLength,
						   uint8_t * mac,
						   uint8_t macLength
						   )
#endif
#ifdef DES
int8_t calculateMAC(uint8_t * key1, uint8_t * key2, uint8_t * key3,
						   uint8_t * payload, 
						   uint16_t  payloadLength,
						   uint8_t * mac,
						   uint8_t macLength
						   )
#endif
{
	do
	{
#ifdef AES
		if ( key == NULL )
		{
			break;
		}
#endif
#ifdef DES
		if ( ( key1 == NULL ) || ( key2 == NULL) || ( key3 == NULL) )
		{
			break;
		}
#endif
		if ( ( payload == NULL) || ( mac == NULL) )
		{
			break;
		}
		else
		{
			uint8_t * payloadOffset = payload;
			uint8_t subKey1[BLOCK_SIZE];
			uint8_t subKey2[BLOCK_SIZE];
			uint8_t lastPayloadBlock[BLOCK_SIZE];
			uint8_t cipherText[BLOCK_SIZE];
			uint8_t cipherTextCopy[BLOCK_SIZE];
			uint16_t n = 0;
			uint16_t i = 0;

			memset( lastPayloadBlock, 0, sizeof( lastPayloadBlock ) );
			memset( cipherText, 0, sizeof( cipherText ) );

			/* Generate subkeys */
#ifdef AES
			generateSubkeys( key, subKey1, subKey2 );
#endif
#ifdef DES
			generateSubkeys( key1, key2, key3, subKey1, subKey2 );
#endif
			
			/* If Mlen is 0, let n = 1; else, let n = ceil ( Mlen / b ). */
			if ( payloadLength == 0	)
			{
				n = 1;	
				lastPayloadBlock[0] = 0x80;
				xorBlocks( subKey2, lastPayloadBlock, lastPayloadBlock, BLOCK_SIZE );
			}
			else
			{
				n = payloadLength / BLOCK_SIZE;
				uint8_t remainder = payloadLength % BLOCK_SIZE ;

				if ( remainder == 0 )
				{	/* Last block is a complete block. Mn = K1 XOR Mn */
					memcpy( lastPayloadBlock, 
							payload + ( ( n - 1 ) * BLOCK_SIZE ) , 
						    BLOCK_SIZE);

					xorBlocks( subKey1, lastPayloadBlock, lastPayloadBlock, BLOCK_SIZE );
				}
				else
				{	/* Last block is not a complete block.  
					   Mn = K2 XOR (Mn *||10j), where j = nb-Mlen-1.
				    */
					
					memcpy( lastPayloadBlock, 
							payload + ( n * BLOCK_SIZE ) , 
						    remainder);
					lastPayloadBlock[remainder] = 0x80;
					xorBlocks( subKey2, lastPayloadBlock, lastPayloadBlock, BLOCK_SIZE );
					n++;
				}
			}

			for ( i = 1; i < n; i++ )
			{
				xorBlocks( cipherText, payloadOffset, cipherTextCopy, BLOCK_SIZE );
#ifdef AES
				encryptAES128( key, cipherTextCopy, cipherText );
#endif
#ifdef DES
				encryptTDES(key1, key2, key3, cipherTextCopy, cipherText);
#endif
				payloadOffset += BLOCK_SIZE;
			}

			/* Append the last block */
			xorBlocks( cipherText, lastPayloadBlock, cipherTextCopy, BLOCK_SIZE );
#ifdef AES
			encryptAES128( key, cipherTextCopy, cipherText );
#endif

#ifdef DES
			encryptTDES( key1, key2, key3, cipherTextCopy, cipherText);
#endif
			/* Extract MAC */
			memcpy( mac, cipherText, macLength );

			/* Wipe Memory */
			memset( subKey1, 0, sizeof( subKey1 ) );
			memset( subKey2, 0, sizeof( subKey2 ) );
			memset( lastPayloadBlock, 0, sizeof( lastPayloadBlock ) );
			memset( cipherText, 0, sizeof( cipherText ) );
			memset( cipherTextCopy, 0, sizeof( cipherText ) );
		}
	} while ( 0 );
	return 0;
}

#ifdef AES
int8_t verifyMAC(uint8_t * key,
						uint8_t * payload, 
						uint16_t  payloadLength,
						uint8_t * mac,
						uint8_t macLength)
#endif
#ifdef DES
int8_t verifyMAC(uint8_t * key1, uint8_t * key2, uint8_t * key3,
						uint8_t * payload, 
						uint16_t  payloadLength,
						uint8_t * mac,
						uint8_t macLength)
#endif
{
	uint8_t macLocal[16];	// Max possible MAC size
#ifdef AES
	calculateMAC( key, payload, payloadLength, macLocal, macLength );
#endif

#ifdef DES
	calculateMAC( key1, key2, key3, payload, payloadLength, macLocal, macLength );
#endif
	return memcmp(macLocal, mac, macLength) == 0;
}

#include <string>

int32_t calculate_mac(algorithm algo, keys * keys,
	uint8_t * payload,
	uint16_t payload_length,
	uint8_t * mac,
	uint8_t mac_length)
{
	int32_t result;
	if ((keys == nullptr) || (payload == nullptr) || (mac == nullptr)) {
		result = RESULT__ERR_INVALID_PARAM;
	} else if ((algo == aes) && (mac_length < 16)) {
		result = RESULT_ERR_ALLOCATED_MEMORY_INSUFFICIENT;
	} else if ((algo == des) && (mac_length < 8)) {
		result = RESULT_ERR_ALLOCATED_MEMORY_INSUFFICIENT;
	} else {		
		uint8_t block_size;

		if (algo == aes) {
			block_size = 16;
		}
		else if (algo == des) {
			block_size = 8;
		}

		uint8_t * payload_offset = payload;
		unique_ptr<uint8_t[]> sub_key1 = make_unique<uint8_t[]>(block_size);
		auto sub_key2 = make_unique<uint8_t[]>(block_size);
		auto last_payload_block = make_unique<uint8_t[]>(block_size);
		auto cipher_text = make_unique<uint8_t[]>(block_size);
		auto cipher_text_copy = make_unique<uint8_t[]>(block_size);
		uint16_t n = payload_length / block_size;

		memset(cipher_text_copy.get(), 0, block_size);
		memset(cipher_text_copy.get(), 0, block_size);

		/* Generate subkeys */
		generate_sub_keys(algo, keys, block_size, sub_key1.get(), sub_key2.get());

		uint8_t sub_key_copy[16];
		memcpy(sub_key_copy, sub_key1.get(), block_size);

		/* If Mlen is 0, let n = 1; else, let n = ceil ( Mlen / b ). */
		if (payload_length == 0)
		{
			last_payload_block[0] = 0x80;
			xor_blocks(sub_key2.get(), last_payload_block.get(), last_payload_block.get(), block_size);
		}
		else
		{			
			uint8_t remainder = payload_length % block_size;

			if (remainder == 0)
			{	/* Last block is a complete block. Mn = K1 XOR Mn */
				memcpy(last_payload_block.get(), payload + ((n - 1) * block_size), block_size);

				xor_blocks(sub_key1.get(), last_payload_block.get(), last_payload_block.get(), block_size);
			}
			else
			{	/* Last block is not a complete block.
				Mn = K2 XOR (Mn *||10j), where j = nb-Mlen-1.
				*/

				memcpy(last_payload_block.get(), payload + (n * block_size), remainder);
				last_payload_block[remainder] = 0x80;
				xor_blocks(sub_key2.get(), last_payload_block.get(), last_payload_block.get(), block_size);
				n++;
			}
		}


		for (uint16_t i = 1; i < n; i++)
		{
			xor_blocks(cipher_text.get(), payload_offset, cipher_text_copy.get(), block_size);
#ifdef AES
			encryptAES128(keys->aes128.key, cipher_text_copy.get(), cipher_text.get());

#endif
#ifdef DES
			encryptTDES(keys->des.key1, keys->des.key2, keys->des.key3, cipher_text_copy.get(), cipher_text.get());
#endif
			payload_offset += block_size;
		}

		/* Append the last block */
		xorBlocks(cipher_text.get(), last_payload_block.get(), cipher_text_copy.get(), block_size);
#ifdef AES
		encryptAES128(keys->aes128.key, cipher_text_copy.get(), cipher_text.get());
#endif

#ifdef DES
		encryptTDES(keys->des.key1, keys->des.key2, keys->des.key3, cipher_text_copy.get(), cipher_text.get());
#endif
		/* Extract MAC */
		memcpy(mac, cipher_text.get(), block_size);

		/* Wipe Memory */
		memset(sub_key1.get(), 0, block_size);
		memset(sub_key2.get(), 0, block_size);
		memset(last_payload_block.get(), 0, block_size);
		memset(cipher_text.get(), 0, block_size);
		memset(cipher_text_copy.get(), 0, block_size);
	}
#if 0
	do
	{


		{
			
			uint16_t i = 0;


	




		}
	} while (0);
	return 0;
#endif
	return 0;
}