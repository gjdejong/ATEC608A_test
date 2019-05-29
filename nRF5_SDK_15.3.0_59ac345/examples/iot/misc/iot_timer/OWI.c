/******************************************************************************************
* Copyright 2017 Ideetron B.V.
* File:     owi.c
* Author:   Adri Verhoef
* Compagny: Ideetron B.V.
* Website:  http://www.ideetron.nl/LoRa
* E-mail:   info@ideetron.nl
* Created on:         17-08-2017
* Supported Hardware: nRF52832
****************************************************************************************/
#include <stdint.h>
#include <string.h>

#include "sdk_config.h"
#include "OWI.h"
#include "boards.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"




/******************************************************************************************
* @brief	Inline function to enable the pull up pin
******************************************************************************************/
void pull_up_enable(void)
{
	nrf_gpio_pin_write(PULL_UP_PIN, 1);
}


/******************************************************************************************
* @brief	Inline function to disable the pull up pin
******************************************************************************************/
void pull_up_disable(void)
{
	nrf_gpio_pin_write(PULL_UP_PIN, 0);
}


/******************************************************************************************
* @brief	Inline function to release the one-wire-interface bus by declaring the pin as an 
*					input
******************************************************************************************/
void owi_release(void)
{
	nrf_gpio_pin_write(OWI_PIN, 1);
	nrf_gpio_cfg_input(OWI_PIN, NRF_GPIO_PIN_NOPULL);
}	


void owi_set_output()
{
    nrf_gpio_cfg_output(OWI_PIN);
}

/******************************************************************************************
* @brief	Inline function to pull the one-wire-interface bus low by declaring the pin as 
*					an output and setting the output to low.
******************************************************************************************/
inline void owi_pull_low(void)
{
	nrf_gpio_cfg_output(OWI_PIN);
	nrf_gpio_pin_write(OWI_PIN, 0);
}	


inline void owi_pull_high(void)
{
	nrf_gpio_cfg_output(OWI_PIN);
	nrf_gpio_pin_write(OWI_PIN, 1);
}	



/******************************************************************************************
* \brief    Function to read a byte from the DS2401
* \Return   The byte received from the DS2401
******************************************************************************************/
uint8_t owi_readbyte (void)
{
	uint8_t data = 0, i;

	for(i = 0; i < 8; i++)
	{	
		owi_pull_low();
//		nrf_delay_us(READ_TLOW);
//		owi_release();
//		nrf_delay_us(READ_TDELAY);
		
		if(nrf_gpio_pin_read(OWI_PIN) == 1)
		{
			data |= (1 << i);
		}

//		nrf_delay_us(READ_TSAMPLE);
	}
	return data;
} /* DS_ReadByte */


void owi_config_input()
{
       nrf_gpio_cfg_input(OWI_PIN, NRF_GPIO_PIN_PULLUP);
}

uint8_t owi_readpin()
{
    return nrf_gpio_pin_read(OWI_PIN);
}


/******************************************************************************************
 * \brief	Function to send a 1 to the DS2401*****************************************************************************************
*/
inline void owi_write_1(void)
{	
	owi_pull_high();
//	nrf_delay_us(10);
//	owi_release();
//	nrf_delay_us(80);
} /* DS_Write_1 */

/******************************************************************************************
 * \brief    Function to send a 0 to the DS2401
******************************************************************************************/
inline void owi_write_0(void)
{
	owi_pull_low();
//	nrf_delay_us(WRITE0_TLOW);
//	owi_release();
//	nrf_delay_us(WRITE0_THIGH);
} /* DS_Write_0 */


/*
*****************************************************************************************
* @brief    Resets the One-Wire Interface to initiate communication and detect the 
*           presence of a slave device on the OWI. 
* @returns	Returns 1 when a slave device is present, returns 0 when not 
*****************************************************************************************
*/
uint8_t owi_reset(void)
{
	uint8_t retVal;
	
	/* Perform the reset pulse */
	owi_pull_low();
	nrf_delay_us(RESET_TLOW);
	owi_release();
	nrf_delay_us(RESET_TREC);
	
	// Sample the one wire bus to determine if a slave is present.
	retVal = nrf_gpio_pin_read(OWI_PIN);
	nrf_delay_us(RESET_THIGH);
	
	return retVal;
} /* DS_Reset */





