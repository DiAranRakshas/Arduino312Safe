#include <LCDMenuLib2.h>
#include <GyverTimer.h>
#include <string>
GTimer Timer(MS, 1500);
int i = 1;
int z = 0;
char customKey;
char Key;
int underLevel = 0;
String array[][1] = {
  {"menu1"},
  {"menu2"},
  {"menu3"}

};
String array1[][1] = {
  {"menu1"},
  {"menu2"},
  {"menu3"}

};
String array2[][1] = {
  {"menu1"},
  {"menu2"},
  {"menu3"}

};
String array3[][1] = {
  {"menu1"},
  {"menu2"},
  {"menu3"}

};
int max = sizeof(array);
int size = 1;
int sizelevel = 1;
int number;
#include <U8g2lib.h>
#include <U8x8lib.h>
#include <Key.h>
#include <Keypad.h>
#include <Arduino.h>
#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_USE_PINS
#include <Wire.h>
#endif

U8G2_HX1230_96X68_F_2ND_4W_HW_SPI u8g2(0, /* reset=*/ 1, /* clock=*/ 2, /* data=*/3);   // pin remapping with ESP8266 HW I2C
const byte ROWS = 4;
const byte COLS = 4;
char hexaKeys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}

};
byte rowPins[ROWS] = { 2,3,4,5 };//подключили первые четыре вывода к пинам Ардуино 2.3.4.5.
byte colPins[COLS] = { 6,7,8,9 };//подключили последние четыре вывода к пинам Ардуино 6.7.8.9.
Keypad customKeypad = Keypad(makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS);
void setup(void) {
    u8g2.begin();
    u8g2.enableUTF8Print();    // enable UTF8 support for the Arduino print()
    u8g2.drawFrame(0, 5, 90, 57);
    u8g2.drawLine(0, 5, 95, 5);
    u8g2.drawLine(0, 57, 95, 57);
    u8g2.setFont(u8g2_font_unifont_t_cyrillic);  //
    u8g2.setFontDirection(0);
}
int e = 0;
int el = 0;
void coutMenu(int b)
{
    String arr[][1];
    switch (b)
    {
    case(0):
        arr[][1] = array[][1];
        break;
    case(1):
        arr[][1] = array1[][1];
        break;
    case(2):
        arr[][1] = array2[][1];
        break;
    case(3):
        arr[][1] = array3[][1];
        break;
    }
    for (int g = 0; g < 5; g++)
    {
        u8g2.setCursor(2, 9 + g * 9);
        if (i == g)
            scrolH(size - 1 + g);
        else
            u8g2.print(array[size - 1 + g][1]);
    }
}
void printBegin(int g)
{
    u8g2.print(array[g][1]);
}
void scrolH(int y)
{

    String q = array[y - 1][1];
    for (int j = 0; j < sizeof(q); j++)
    {
        if (sizeof(q) - e > 15)
        {
            if (e != 0)
            {
                for (int w = 0; w < 15; w++)
                    u8g2.print(q[w + e]);
                e++;
            }
            else
                e++;
        }
        else
        {
            printBegin(y);
            e = 0;
        }

    }
}
void custom(char key)
{
        switch (key)
        {
        case 2:
            if (i > 1)
                i--;
            else
                if (size > 1)
                    size--;
            e = 1;
            break;
        case 8:
            if (i < 3)
                i++;
            else
                if (size < max)
                    size++;
            e = 1;

            break;
        case 6:
            switch (size)
            {
            case 1:
                underLevel = 1;
                break;
            case 2:
                underLevel = 2;
                break;
            case 3:
                underLevel = 3;
                break;
            }

            break;
        case 4:
            break;
        };
        if (key == 6)
        {
            number = size;
            UnderLevel(underLevel);
        }
        else
            if(key==4)
                coutMenu(0);
}
void UnderLevel(int o)
{
    while (customKey != 4)
    {
        customKey == 'n';
        switch (o)
        {
        case 1:
            while (customKey == 'n')
            {
                coutMenu(o);
                Timer.reset();
                while (customKey == 'n' || Timer.isReady() != 1)
                    char customKey = customKeypad.getKey();

            }
            if(customKey!=4)
            customUnderLevel(customKey);

        }
    }
}
void customUnderLevel(char key)
{
        switch (key)
        {
        case 2:
            if (i > 1)
                il--;
            else
                if (size > 1)
                    sizelevel--;
            el = 1;
            break;
        case 8:
            if (i < 3)
                il++;
            else
                if (size < max)
                    sizelevel++;
            el = 1;

            break;
        case 6:
            switch ()
            {
            case 1:
                underLevel = 1;
                break;
            case 2:
                underLevel = 2;
                break;
            case 3:
                underLevel = 3;
                break;
            }

            break;
        case 4:
            break;
        };
        if (key == 6)
        {
            coutMenu(underLevel);
            UnderLevel(underLevel);
        }
        else
            if (key == 4)
                coutMenu(size);
}
void loop() {
    customKey = 'n';
    u8g2.clear();
    coutMenu(0);
    u8g2.drawFrame(2, 8 + 9 * i - 9, 90, 17 + 9 * i);
    Timer.reset();
    while (customKey == 'n' || Timer.isReady() != 1)
        char customKey = customKeypad.getKey();
    if (customKey != 'n')
        custom(customKey);
}
