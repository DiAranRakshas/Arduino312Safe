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
TEST(uint8_t DIN, uint8_t CLK)
{

    this->DIN = DIN;
    this->CLK = CLK;

    /*
      lcd.drawRect(0,5,90, 57,1);
     lcd.drawLine(uint8_t (0), uint8_t (5), uint8_t (95), uint8_t (5),uint8_t (1));
     lcd.drawLine(uint8_t (0), uint8_t (57), uint8_t (95), uint8_t (57), uint8_t (1)); */
};
