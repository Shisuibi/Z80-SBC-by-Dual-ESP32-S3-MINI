#ifndef ESP32_H
#define ESP32_H

// SPI_DRIVER_SELECT must be set to 0 in SdFat/SdFatConfig.h (default is 0)

SdFat SD;
#define LedS3DevKitM	48
#define LedS3Zero		21
#define SPIINIT	((iNeoPix == LedS3DevKitM)?12:12),\
				((iNeoPix == LedS3DevKitM)?13:13),\
				((iNeoPix == LedS3DevKitM)?11:11),\
				((iNeoPix == LedS3DevKitM)? 9:10)				// sck, miso, mosi, cs
#define SDMHZ 20
#define SDINIT	((iNeoPix == LedS3DevKitM)? 9:10), SD_SCK_MHZ(SDMHZ)
#define LED 0
#define LEDinv 0
#define BOARD "ESP32-S3-DevKitM / Zero"
#define board_esp32
#define board_digital_io

uint8 esp32bdos(uint16 dmaaddr) {
	return(0x00);
}

static uint8_t iNeoPix = LED;

void NeoPixWrite(uint8_t iLedPin, uint8_t iLedBit) {
	if(iNeoPix == LED) {
		pinMode(iNeoPix = LedS3DevKitM, INPUT_PULLDOWN);		//	ESP32-S3-DevKitM (Slave)
		if(digitalRead(iNeoPix) == LOW) iNeoPix = LedS3Zero;	//	ESP32-S3-Zero
	}

	if(iLedBit == LOW)	neopixelWrite(iNeoPix, 0x00, 0x00, 0x00);
	else				neopixelWrite(iNeoPix, 0x40, 0x00, 0x80);
}

#endif
