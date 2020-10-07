// Fast HX1230 96x68 LCD graphics library with fb
// (C) 2019 by Pawel A. Hernik

/*
  HX1230 96x68 LCD connections (header on bottom, from left):
  #1 RST - D6 or any digital
  #2 CE  - D7 or any digital
  #3 N/C
  #4 DIN - D11/MOSI 
  #5 CLK - D13/SCK
  #6 VCC - 3V3
  #7 BL  - 3V3 or any digital via resistor
  #8 GND - GND
*/

#ifndef TEST_h
#define TEST_h
#include <Arduino.h>
#include "TEST.cpp"



#define LCD_RST 6
#define LCD_CS  7
#define LCD_BL  8
HX1230_FB lcd(LCD_RST, LCD_CS);
class TEST
{
private:
    uint8_t DIN;
    uint8_t CLK;
    uint8_t rst;
    uint8_t cs;


public:
    TEST(uint8_t rstk, uint8_t cs, uint8_t DIN, uint8_t CLK, HX1230_FB& lc);
    


};

#endif
