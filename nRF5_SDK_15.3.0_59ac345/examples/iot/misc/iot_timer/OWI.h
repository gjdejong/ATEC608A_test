/******************************************************************************************
* Copyright 2017 Ideetron B.V.
* File:     owi.h
* Author:   Adri Verhoef
* Compagny: Ideetron B.V.
* Website:  http://www.ideetron.nl/LoRa
* E-mail:   info@ideetron.nl
* Created on:         17-08-2017
* Supported Hardware: nRF52832
****************************************************************************************/

#ifndef OWI_H
#define	OWI_H
	
	#include <stdint.h>
	
	// Read definitions
	#define READ_TLOW			10	//  1us <= tLOW1   < 15us
	#define	READ_TDELAY		10
	#define READ_TSAMPLE	120	// 60us <= tSAMPLE < 120us
	
	// Write definitions
	#define WRITE0_TLOW		80	// 60us <= tSAMPLE < 120us
	#define	WRITE0_THIGH 	10
	
	#define WRITE1_TLOW		10	//  1us <= tLOW1 < 15us
	#define	WRITE1_THIGH 	80
	
	#define RESET_TLOW		600 // 480us - infinite
	#define RESET_TREC		10
	#define RESET_THIGH		15  // 480us - infinite
	
	
	void 	pull_up_enable			(void);
	void 	pull_up_disable			(void);
	void 	owi_release					(void);
	void 	owi_pull_low				(void);
							 
uint8_t owi_readbyte 				(void);
uint8_t owi_reset						(void);
 void 	owi_write_1					(void);
 void 	owi_write_0					(void);

#endif	/* OWI_H */

