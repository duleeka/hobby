#pragma once
#include <cstdint>

#define AES

#ifndef AES
#define DES
#endif

#define RESULT_SUCCESS (0)
#define RESULT__ERR_INVALID_PARAM (-1)
#define RESULT_ERR_ALLOCATED_MEMORY_INSUFFICIENT (-2)

enum algorithm
{
	aes,
	des
};

union key_data
{
	struct
	{
		uint8_t key1[8];
		uint8_t key2[8];
		uint8_t key3[8];
	}des;

	struct
	{
		uint8_t key[16];
	}aes128;

};

int32_t calculate_mac(algorithm algo, key_data * keys,
	uint8_t * payload,
	uint16_t payload_length,
	uint8_t * mac,
	uint8_t mac_length);

#ifdef AES
int8_t calculateMAC(uint8_t * key,
	uint8_t * payload,
	uint16_t  payloadLength,
	uint8_t * mac,
	uint8_t macLength
	);

int8_t verifyMAC(uint8_t * key,
	uint8_t * payload,
	uint16_t  payloadLength,
	uint8_t * mac,
	uint8_t macLength);
#endif //AES

#ifdef DES
int8_t calculateMAC(uint8_t * key1, uint8_t * key2, uint8_t * key3,
	uint8_t * payload,
	uint16_t  payloadLength,
	uint8_t * mac,
	uint8_t macLength
	);

int8_t verifyMAC(uint8_t * key1, uint8_t * key2, uint8_t * key3,
	uint8_t * payload,
	uint16_t  payloadLength,
	uint8_t * mac,
	uint8_t macLength);
#endif //DES
