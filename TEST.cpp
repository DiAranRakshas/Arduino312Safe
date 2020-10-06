

TEST(uint8_t rstk, uint8_t cs, uint8_t DIN, uint8_t CLK, HX1230_FB& lc)
    {



        this->DIN = DIN;
        this->CLK = CLK;
        this->rst = rstk;
        this->cs = cs;
        lc.drawRect(uint8_t(1), uint8_t(5), uint8_t(90), uint8_t(57), uint8_t(1));
        lc.drawLine(uint8_t(1), uint8_t(5), uint8_t(95), uint8_t(5), uint8_t(1));
        lc.drawLine(uint8_t(1), uint8_t(57), uint8_t(95), uint8_t(57), uint8_t(1));
    };
