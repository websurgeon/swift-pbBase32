//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

enum Base32TestVector {
    case test_0Byte
    case test_1Byte
    case test_2Byte
    case test_3Byte
    case test_4Byte
    case test_5Byte
    case test_6Byte
    case test_10Byte
    case test_15Byte
    case test_RFC4648_Test_Vector_1
    case test_RFC4648_Test_Vector_2
    case test_RFC4648_Test_Vector_3
    case test_RFC4648_Test_Vector_4
    case test_short_phrase
    case test_longer_phrase
}

struct TestVectors {
    static var base32: [ Base32TestVector :  TestVector ] {
        return [
            .test_0Byte: TestVector(decoded: "", encoded: ""),
            .test_1Byte: TestVector(decoded: "1", encoded: "GE======"),
            .test_2Byte: TestVector(decoded: "12", encoded: "GEZA===="),
            .test_3Byte: TestVector(decoded: "123", encoded: "GEZDG==="),
            .test_4Byte: TestVector(decoded: "1234", encoded: "GEZDGNA="),
            .test_5Byte: TestVector(decoded: "12345", encoded: "GEZDGNBV"),
            .test_6Byte: TestVector(decoded: "123456", encoded: "GEZDGNBVGY======"),
            .test_10Byte: TestVector(decoded: "1234567890", encoded: "GEZDGNBVGY3TQOJQ"),
            .test_15Byte: TestVector(decoded: "123451234512345", encoded: "GEZDGNBVGEZDGNBVGEZDGNBV"),
            .test_RFC4648_Test_Vector_1: TestVector(decoded: "foo", encoded: "MZXW6==="),
            .test_RFC4648_Test_Vector_2: TestVector(decoded: "foob", encoded: "MZXW6YQ="),
            .test_RFC4648_Test_Vector_3: TestVector(decoded: "fooba", encoded: "MZXW6YTB"),
            .test_RFC4648_Test_Vector_4: TestVector(decoded: "foobar", encoded: "MZXW6YTBOI======"),
            .test_short_phrase: TestVector(decoded: "THIS IS THE HOUSE THAT JACK BUILT", encoded: "KREESUZAJFJSAVCIIUQEQT2VKNCSAVCIIFKCASSBINFSAQSVJFGFI==="),
            .test_longer_phrase: TestVector(decoded: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", encoded: "JRXXEZLNEBUXA43VNUQGI33MN5ZCA43JOQQGC3LFOQWCAY3PNZZWKY3UMV2HK4RAMFSGS4DJONUWG2LOM4QGK3DJOQWCA43FMQQGI3ZAMVUXK43NN5SCA5DFNVYG64RANFXGG2LENFSHK3TUEB2XIIDMMFRG64TFEBSXIIDEN5WG64TFEBWWCZ3OMEQGC3DJOF2WCLRAKV2CAZLONFWSAYLEEBWWS3TJNUQHMZLONFQW2LBAOF2WS4ZANZXXG5DSOVSCAZLYMVZGG2LUMF2GS33OEB2WY3DBNVRW6IDMMFRG64TJOMQG42LTNEQHK5BAMFWGS4LVNFYCAZLYEBSWCIDDN5WW233EN4QGG33OONSXC5LBOQXCARDVNFZSAYLVORSSA2LSOVZGKIDEN5WG64RANFXCA4TFOBZGK2DFNZSGK4TJOQQGS3RAOZXWY5LQORQXIZJAOZSWY2LUEBSXG43FEBRWS3DMOVWSAZDPNRXXEZJAMV2SAZTVM5UWC5BANZ2WY3DBEBYGC4TJMF2HK4ROEBCXQY3FOB2GK5LSEBZWS3TUEBXWGY3BMVRWC5BAMN2XA2LEMF2GC5BANZXW4IDQOJXWSZDFNZ2CYIDTOVXHIIDJNYQGG5LMOBQSA4LVNEQG6ZTGNFRWSYJAMRSXGZLSOVXHIIDNN5WGY2LUEBQW42LNEBUWIIDFON2CA3DBMJXXE5LN"),
        ]
    }
}

