//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension TestVectors {
    static var base32JSONObject: Any {
        return [
            [
                "name": "0 bytes",
                "decoded": "",
                "encoded": "",
                ],
            [
                "name": "1 bytes",
                "decoded": "1",
                "encoded": "GE======",
                ],
            [
                "name": "2 bytes",
                "decoded": "12",
                "encoded": "GEZA====",
                ],
            [
                "name": "3 bytes",
                "decoded": "123",
                "encoded": "GEZDG===",
                ],
            [
                "name": "4 bytes",
                "decoded": "1234",
                "encoded": "GEZDGNA=",
                ],
            [
                "name": "5 bytes",
                "decoded": "12345",
                "encoded": "GEZDGNBV",
                ],
            [
                "name": "6 bytes",
                "decoded": "123456",
                "encoded": "GEZDGNBVGY======",
                ],
            [
                "name": "10 bytes",
                "decoded": "1234567890",
                "encoded": "GEZDGNBVGY3TQOJQ",
                ],
            [
                "name": "15 bytes",
                "decoded": "123451234512345",
                "encoded": "GEZDGNBVGEZDGNBVGEZDGNBV",
                ],
            [
                "name": "RFC4648 Test Vector 1",
                "decoded": "foo",
                "encoded": "MZXW6===",
                ],
            [
                "name": "RFC4648 Test Vector 2",
                "decoded": "foob",
                "encoded": "MZXW6YQ=",
                ],
            [
                "name": "RFC4648 Test Vector 3",
                "decoded": "fooba",
                "encoded": "MZXW6YTB",
                ],
            [
                "name": "RFC4648 Test Vector 4",
                "decoded": "foobar",
                "encoded": "MZXW6YTBOI======",
                ],
            [
                "name": "short phrase",
                "decoded": "THIS IS THE HOUSE THAT JACK BUILT",
                "encoded": "KREESUZAJFJSAVCIIUQEQT2VKNCSAVCIIFKCASSBINFSAQSVJFGFI===",
                ],
            [
                "name": "longer phrase",
                "decoded": "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                "encoded": "JRXXEZLNEBUXA43VNUQGI33MN5ZCA43JOQQGC3LFOQWCAY3PNZZWKY3UMV2HK4RAMFSGS4DJONUWG2LOM4QGK3DJOQWCA43FMQQGI3ZAMVUXK43NN5SCA5DFNVYG64RANFXGG2LENFSHK3TUEB2XIIDMMFRG64TFEBSXIIDEN5WG64TFEBWWCZ3OMEQGC3DJOF2WCLRAKV2CAZLONFWSAYLEEBWWS3TJNUQHMZLONFQW2LBAOF2WS4ZANZXXG5DSOVSCAZLYMVZGG2LUMF2GS33OEB2WY3DBNVRW6IDMMFRG64TJOMQG42LTNEQHK5BAMFWGS4LVNFYCAZLYEBSWCIDDN5WW233EN4QGG33OONSXC5LBOQXCARDVNFZSAYLVORSSA2LSOVZGKIDEN5WG64RANFXCA4TFOBZGK2DFNZSGK4TJOQQGS3RAOZXWY5LQORQXIZJAOZSWY2LUEBSXG43FEBRWS3DMOVWSAZDPNRXXEZJAMV2SAZTVM5UWC5BANZ2WY3DBEBYGC4TJMF2HK4ROEBCXQY3FOB2GK5LSEBZWS3TUEBXWGY3BMVRWC5BAMN2XA2LEMF2GC5BANZXW4IDQOJXWSZDFNZ2CYIDTOVXHIIDJNYQGG5LMOBQSA4LVNEQG6ZTGNFRWSYJAMRSXGZLSOVXHIIDNN5WGY2LUEBQW42LNEBUWIIDFON2CA3DBMJXXE5LN",
                ]
        ]
    }
}

