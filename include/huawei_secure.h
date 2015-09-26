/*
 * Copyright (C) 2015  Rudolf Tammekivi <rtammekivi@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see [http://www.gnu.org/licenses/].
 */

struct otp_key {
	uint8_t key1[0x104];
	uint8_t key2[0x104];
} __attribute__((packed));

/* Read RSA public key */
extern int otp_data_read(void *key);

extern int rsa_public_decrypt(void *buf, int size, void *dec_buf, int *dec_size,
			      void *key);
