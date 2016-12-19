#include "stdafx.h"
#include "SP_800_38B.h"

#include <cassert>
#include <iostream>

static key_data mac_keys;
static uint8_t payload[] = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96,
                             0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
							0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c,
							0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
							0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11,
							0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
							0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17,
							0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10 };

void test_zero_length_payload_aes()
{
	uint8_t mac[16];

	uint8_t expected_mac[] = { 0xbb, 0x1d, 0x69, 0x29,
		0xe9, 0x59, 0x37, 0x28,
		0x7f, 0xa3, 0x7d, 0x12,
		0x9b, 0x75, 0x67, 0x46 };

	int32_t result = calculate_mac(aes, &mac_keys, payload, 0, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_128bit_length_payload_aes()
{
	uint8_t mac[16];

	uint8_t expected_mac[] = { 0x07, 0x0a, 0x16, 0xb4,
		0x6b, 0x4d, 0x41, 0x44,
		0xf7, 0x9b, 0xdd, 0x9d,
		0xd0, 0x4a, 0x28, 0x7c };

	int32_t result= calculate_mac(aes, &mac_keys, payload, 128 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_320bit_length_payload_aes()
{
	uint8_t mac[16];

	uint8_t expected_mac[] = { 0xdf, 0xa6, 0x67, 0x47,
		0xde, 0x9a, 0xe6, 0x30,
		0x30, 0xca, 0x32, 0x61,
		0x14, 0x97, 0xc8, 0x27 };

	int32_t result = calculate_mac(aes, &mac_keys, payload, 320 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_512bit_length_payload_aes()
{
	uint8_t mac[16];

	uint8_t expected_mac[] = { 0x51, 0xf0, 0xbe, 0xbf,
		0x7e, 0x3b, 0x9d, 0x92,
		0xfc, 0x49, 0x74, 0x17,
		0x79, 0x36, 0x3c, 0xfe };

	int32_t result = calculate_mac(aes, &mac_keys, payload, 512 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}


void test_zero_length_payload_des_3key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0xb7, 0xa6, 0x88, 0xe1, 0x22, 0xff, 0xaf, 0x95 };
	uint8_t payload[1];

	int32_t result = calculate_mac(des, &mac_keys, payload, 0, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_zero_length_payload_des_2key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0xbd, 0x2e, 0xbf, 0x9a, 0x3b, 0xa0, 0x03, 0x61 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 0, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_zero_length_payload_des_3key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x7D, 0xB0, 0xD3, 0x7D, 0xF9, 0x36, 0xC5, 0x50 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 0, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_zero_length_payload_des_2key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x79, 0xCE, 0x52, 0xA7, 0xF7, 0x86, 0xA9, 0x60 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 0, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}


void test_64bit_length_payload_des_3key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x8e, 0x8f, 0x29, 0x31, 0x36, 0x28, 0x37, 0x97 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 64 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_64bit_length_payload_des_2key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x4f, 0xf2, 0xab, 0x81, 0x3c, 0x53, 0xce, 0x83 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 64 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_128bit_length_payload_des_3key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x30, 0x23, 0x9C, 0xF1, 0xF5, 0x2E, 0x66, 0x09 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 128 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_128bit_length_payload_des_2key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0xCC, 0x18, 0xA0, 0xB7, 0x9A, 0xF2, 0x41, 0x3B };

	int32_t result = calculate_mac(des, &mac_keys, payload, 128 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}


void test_160bit_length_payload_des_3key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x74, 0x3d, 0xdb, 0xe0, 0xce, 0x2d, 0xc2, 0xed };

	int32_t result = calculate_mac(des, &mac_keys, payload, 160 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_160bit_length_payload_des_2key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x62, 0xdd, 0x1b, 0x47, 0x19, 0x02, 0xbd, 0x4e };

	int32_t result = calculate_mac(des, &mac_keys, payload, 160 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_160bit_length_payload_des_3key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x6C, 0x9F, 0x3E, 0xE4, 0x92, 0x3F, 0x6B, 0xE2 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 160 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_160bit_length_payload_des_2key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0xC0, 0x6D, 0x37, 0x7E, 0xCD, 0x10, 0x19, 0x69 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 160 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_256bit_length_payload_des_3key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x33, 0xe6, 0xb1, 0x09, 0x24, 0x00, 0xea, 0xe5 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 256 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_256bit_length_payload_des_2key_new()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x31, 0xb1, 0xe4, 0x31, 0xda, 0xbc, 0x4e, 0xb8 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 256 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}


void test_256bit_length_payload_des_3key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x99, 0x42, 0x9B, 0xD0, 0xBF, 0x79, 0x04, 0xE5 };

	int32_t result = calculate_mac(des, &mac_keys, payload, 256 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}

void test_256bit_length_payload_des_2key()
{
	uint8_t mac[8];

	uint8_t expected_mac[] = { 0x9C, 0xD3, 0x35, 0x80, 0xF9, 0xB6, 0x4D, 0xFB };

	int32_t result = calculate_mac(des, &mac_keys, payload, 256 / 8, mac, sizeof(mac));
	assert(result == RESULT_SUCCESS);

	result = memcmp(mac, expected_mac, sizeof(expected_mac));
	assert(result == 0);
}


int _tmain(int argc, _TCHAR* argv[])
{
#ifdef AES
	//Using AES exampels.
	mac_keys.aes128 = { { 0x2b, 0x7e, 0x15, 0x16,
		0x28, 0xae, 0xd2, 0xa6,
		0xab, 0xf7, 0x15, 0x88,
		0x09, 0xcf, 0x4f, 0x3c } };

	test_zero_length_payload_aes();
	test_128bit_length_payload_aes();
	test_320bit_length_payload_aes();
	test_512bit_length_payload_aes();
#endif

#ifdef DES
	//Using 3 key DES updated CMAC examples.
	mac_keys.des = {{ 0x8a, 0xa8, 0x3b, 0xf8, 0xcb, 0xda, 0x10, 0x62 }, 
	                { 0x0b, 0xc1, 0xbf, 0x19, 0xfb, 0xb6, 0xcd, 0x58 },
					{ 0xbc, 0x31, 0x3d, 0x4a, 0x37, 0x1c, 0xa8, 0xb5 }};

	test_zero_length_payload_des_3key_new();
	test_64bit_length_payload_des_3key_new();
	test_160bit_length_payload_des_3key_new();
	test_256bit_length_payload_des_3key_new();

	//Using 2 key DES updated CMAC examples.
	mac_keys.des = {{ 0x4c, 0xf1, 0x51, 0x34, 0xa2, 0x85, 0x0d, 0xd5 }, 
	                { 0x8a, 0x3d, 0x10, 0xba, 0x80, 0x57, 0x0d, 0x38 },
					{ 0x4c, 0xf1, 0x51, 0x34, 0xa2, 0x85, 0x0d, 0xd5 }};

	test_zero_length_payload_des_2key_new();
	test_64bit_length_payload_des_2key_new();
	test_160bit_length_payload_des_2key_new();
	test_256bit_length_payload_des_2key_new();

	//Using 3 key DES CMAC examples.
	mac_keys.des = { { 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF },
	                 { 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01 },
	                 { 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01, 0x23 }};

	test_zero_length_payload_des_3key();
	test_128bit_length_payload_des_3key();
	test_160bit_length_payload_des_3key();
	test_256bit_length_payload_des_3key();

	//Using 2 key DES CMAC examples.
	mac_keys.des = { { 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF },
                     { 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF, 0x01 },
					 { 0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF } };

	test_zero_length_payload_des_2key();
	test_128bit_length_payload_des_2key();
	test_160bit_length_payload_des_2key();
	test_256bit_length_payload_des_2key();
#endif
	return 0;
}


#if 0

#include <array>

int _tmain____(int argc, _TCHAR* argv[])
{


	mac_keys.aes128 = { { 0x2b, 0x7e, 0x15, 0x16,
		0x28, 0xae, 0xd2, 0xa6,
		0xab, 0xf7, 0x15, 0x88,
		0x09, 0xcf, 0x4f, 0x3c } };

	test_zero_length_payload_aes();
	test_128bit_length_payload_aes();
	test_320bit_length_payload_aes();
	test_512bit_length_payload_aes();

	uint8_t aesKey[] = { 0x2b, 0x7e, 0x15, 0x16,
		0x28, 0xae, 0xd2, 0xa6,
		0xab, 0xf7, 0x15, 0x88,
		0x09, 0xcf, 0x4f, 0x3c };

#if 0
	uint8_t plainTextBlock[] = { 0x00, 0x01, 0x02, 0x03,
		0x04, 0x05, 0x06, 0x07,
		0x08, 0x09, 0x0A, 0x0B,
		0x0C, 0x0D, 0x0E, 0x0F,
		0x00, 0x01, 0x02, 0x03,
		0x04, 0x05, 0x06, 0x07,
		0x08, 0x09, 0x0A, 0x0B,
		0x0C, 0x0D, 0x0E, 0x0F,
		0x00, 0x01, 0x02, 0x03,
		0x04, 0x05, 0x06, 0x07,
		0x08, 0x09, 0x0A, 0x0B,
		0x0C, 0x0D, 0x0E, 0x0F };

	uint8_t *pPlainTextBlock = plainTextBlock;

	uint8_t cypherCBC[sizeof(plainTextBlock)];
	uint8_t cipherBlock[sizeof(plainTextBlock)];
	uint8_t *pCipherBlock = cipherBlock;

	uint8_t xorBlock[16];

	memset(xorBlock, 0, sizeof(xorBlock));
	memset(cipherBlock, 0, sizeof(cipherBlock));
	memset(cypherCBC, 0, sizeof(cypherCBC));

	xorBlocks(pPlainTextBlock, pCipherBlock, xorBlock, 16);
	for (int i = 0; i < (sizeof(plainTextBlock) / 16); i++)
	{


		AES_KEY enc_key;
		memset(&enc_key, 0, sizeof(enc_key));
		AES_set_encrypt_key(aesKey, 128, &enc_key);
		AES_ecb_encrypt(xorBlock, pCipherBlock, &enc_key, AES_ENCRYPT);

		pPlainTextBlock += 16;
		xorBlocks(pPlainTextBlock, pCipherBlock, xorBlock, 16);
		pCipherBlock += 16;
	}


	{
		uint8_t iv[16];
		AES_KEY enc_key;
		memset(&enc_key, 0, sizeof(enc_key));
		memset(iv, 0, sizeof(iv));
		memset(cypherCBC, 0, sizeof(cypherCBC));
		AES_set_encrypt_key(aesKey, 128, &enc_key);
		AES_cbc_encrypt(plainTextBlock, cypherCBC, sizeof(plainTextBlock), &enc_key, iv, AES_ENCRYPT);
	}

	int val = memcmp(cypherCBC, cipherBlock, sizeof(cipherBlock));

#endif
	return 0;
}
#endif
