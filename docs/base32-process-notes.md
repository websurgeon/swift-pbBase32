Copyright (C) 2013 Peter Barclay
License: [MIT License](../LICENSE.txt)

## Base32 Encoding

The following description of the Base32 encoding and decoding process has been derived from the information detailed in RFC4648.


#### Base32 Alphabet:

    0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31    
    A B C D E F G H I J K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  2  3  4  5  6  7 

### Example: encoding '1234567890' (two 40-bit blocks)

Encoding:

    input   1        2        3        4        5        6        7        8        9        0
    ascii   49       50       51       52       53       54       55       56       57       48
    8-bit   00110001 00110010 00110011 00110100 00110101 00110110 00110111 00111000 00111001 00110000   
    5-bit   00110 00100 11001 00011 00110 01101 00001 10101 00110 11000 11011 10011 10000 01110 01001 10000
    dec     6     4     25    3     6     13    1     21    6     24    27    19    16    14    9     16         
    base32  G     E     Z     D     G     N     B     V     G     Y     3     T     Q     O     J     Q

Result:

    1234567890 => GEZDGNBVGY3TQOJQ


### Process for encoding each 40-bit block

40-bit block = 5 x 8-bit = 8 x 5-bit
So five bytes can be translated to eight 5-bit groups

        b0       b1       b2       b3       b4
        xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx xxxxxxxx   5-bit       remainder    combine bit shifted and 5-bit masked bytes
    g0  xxxxx                                          <b0-5>      b0-r3        ((b0 >> 3) & 11111)                     )
    g1       xxx xx                                    <b0-3 b1-2> b1-r6        ((b0 << 2) & 11100) | ((b1 >> 6) & 00011)
    g2             xxxxx                               <b1-5>      b1-r1        ((b1 >> 1) & 11111)                     )
    g3                  x xxxx                         <b1-1 b2-4> b2-r4        ((b1 << 4) & 10000) | ((b2 >> 4) & 01111)
    g4                        xxxx x                   <b2-4 b3-1> b3-r7        ((b2 << 1) & 11110) | ((b3 >> 7) & 00001)
    g5                              xxxxx              <b3-5>      b3-r2        ((b3 >> 2) & 11111)                     )
    g6                                   xx xxx        <b3-2 b4-3> b4-r5        ((b3 << 3) & 11000) | ((b4 >> 5) & 00111)
    g7                                         xxxxx   <b4-5>                   ((b4       & 11111)                     )

key for translating 5-bit mask for shifted bytes into hex

    bin     dec  hex
    11111 = 31 = 0x1f
    11100 = 28 = 0x1c
    00011 =  3 = 0x03
    10000 = 16 = 0x10
    01111 = 15 = 0x0f
    11110 = 30 = 0x1e
    00001 = 01 = 0x01
    11000 = 24 = 0x18
    00111 =  7 = 0x07

The eight 5-bit groups g0-g7 are then mapped to a base32 alphabet character and concatinated as the encoded output.

The last block may be partial (< 40-bits). Padding with a number of '=' chars is required depending on how partial the block is:

    bitCount = (dataLength * 8)
    1. (bitCount % 40) ==  0    =>     no partial block
    2. (bitCount % 40) ==  8    =>     padding = 6 x '='   =>  xx======
    3. (bitCount % 40) == 16    =>     padding = 4 x '='   =>  xxxx====
    4. (bitCount % 40) == 24    =>     padding = 3 x '='   =>  xxxxx===
    5. (bitCount % 40) == 32    =>     padding = 1 x '='   =>  xxxxxxx=


----------------------------------------------------
## Base32 Decoding

    input   G        E        Z        D        G        N        B        V        G        Y        3        T        Q        O        J        Q     
    lookup  6        4        25       3        6        13       1        21       6        24       27       19       16       14       9        16
    5-bit   00110    00100    11001    00011    00110    01101    00001    10101    00110    11000    11011    10011    10000    01110    01001    10000
    8-bit   00110001 00110010 00110011 00110100 00110101 00110110 00110111 00111000 00111001 00110000
    ascii   1        2        3        4        5        6        7        8        9        0

### Process for decoding each 8-bytes of encoded data

        g0       g1       g2       g3       g4       g5       g6       g7
        000xxxxx 000xxxxx 000xxxxx 000xxxxx 000xxxxx 000xxxxx 000xxxxx 000xxxxx
    b0     xxxxx    xxx                                                             ((g0 << 3) & 11111000) | ((g1 >> 2) & 00000111)
    b1                 xx    xxxxx    x                                             ((g1 << 6) & 11000000) | ((g2 << 1) & 00111110) | ((g3 >> 4) & 00000001)
    b2                                 xxxx    xxxx                                 ((g3 << 4) & 11110000) | ((g4 >> 1) & 00001111)
    b3                                             x    xxxxx    xx                 ((g4 << 7) & 10000000) | ((g5 << 2) & 01111100) | ((g6 >> 3) & 00000011)
    b4                                                             xxx    xxxxx     ((g6 << 5) & 11100000) | ((g7     ) & 00011111)

key for translating 8-bit mask for shifted bytes into hex
    
    bin        dec   hex
    11111000 = 248 = 0xf8
    00000111 =   7 = 0x07
    11000000 = 192 = 0xc0
    00111110 =  62 = 0x3e
    00000001 =   1 = 0x01
    11110000 = 240 = 0xf0
    00001111 =  15 = 0x0f
    10000000 = 128 = 0x80
    01111100 = 124 = 0x7c
    00000011 =   3 = 0x03
    11100000 = 224 = 0xe0
    00011111 =  31 = 0x1f

The eight 5-bit groups g0-g7 are the index value (0 - 31) from the base32Alphabet. The index value is obtained the following mapping:

    {
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  //   0 -  15 => 0x00 - 0x0f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  //  16 -  31 => 0x10 - 0x1f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  //  32 -  47 => 0x20 - 0x2f
        255,255, 26, 27,  28, 29, 30, 31, 255,255,255,255, 255,255,255,255,  //  48 -  63 => 0x30 - 0x3f
        255,  0,  1,  2,   3,  4,  5,  6,   7,  8,  9, 10,  11, 12, 13, 14,  //  64 -  79 => 0x40 - 0x4f
         15, 16, 17, 18,  19, 20, 21, 22,  23, 24, 25,255, 255,255,255,255,  //  80 -  95 => 0x50 - 0x5f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  //  96 - 111 => 0x60 - 0x6f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 112 - 127 => 0x70 - 0x7f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 128 - 143 => 0x80 - 0x8f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 144 - 159 => 0x90 - 0x9f
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 160 - 175 => 0xa0 - 0xaf
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 176 - 191 => 0xb0 - 0xbf
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 192 - 207 => 0xc0 - 0xcf
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 208 - 223 => 0xd0 - 0xdf
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255,  // 224 - 239 => 0xe0 - 0xef
        255,255,255,255, 255,255,255,255, 255,255,255,255, 255,255,255,255   // 240 - 255 => 0xf0 - 0xff
    }

The last block may be partial (< 8-bytes). The Padding '=' can be used to determine the resulting byte length of the partial block:

    6 x '=' => 1 of 5 bytes
    4 x '=' => 2 of 5 bytes
    3 x '=' => 3 of 5 bytes
    1 x '=' => 4 of 5 bytes

This can then be used to create a mapping array that converts number of padding chars (0, 1, 3, 4, 6) into the number of bytes in the partial block.

    {0, 4, 255, 3, 2, 255, 1}; // 255 = invalid padding

