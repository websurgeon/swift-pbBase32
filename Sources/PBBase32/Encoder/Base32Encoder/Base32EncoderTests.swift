//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32EncoderTests: XCTestCase {
    var sut: ByteArrayEncoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Encoder.encoder()
    }
    
    func test_encode_zeroBytes() {
        assert(encoder: sut, encodes: "", to: "")
    }
    
    func test_encode_1Byte() {
        assert(encoder: sut, encodes: "1", to: "GE======")
    }

    func test_encode_2Bytes() {
        assert(encoder: sut, encodes: "12", to: "GEZA====")
    }

    func test_encode_3Bytes() {
        assert(encoder: sut, encodes: "123", to: "GEZDG===")
    }

    func test_encode_4Bytes() {
        assert(encoder: sut, encodes: "1234", to: "GEZDGNA=")
    }

    func test_encode_5Bytes() {
        assert(encoder: sut, encodes: "12345", to: "GEZDGNBV")
    }

//    func test_encode_6Byte() {
//        assert(encoder: sut, encodes: "123456", to: "GEZDGNBVGY======")
//    }
//
//    func test_encode_10Bytes() {
//        assert(encoder: sut, encodes: "1234567890", to: "GEZDGNBVGY3TQOJQ")
//    }
//
//    func test_encode_15Bytes() {
//        assert(encoder: sut, encodes: "123451234512345", to: "GEZDGNBVGEZDGNBVGEZDGNBV")
//    }
//
//    func test_encode_RFC4648TestVector1() {
//        assert(encoder: sut, encodes: "foo", to: "MZXW6===")
//    }
//
//    func test_encode_RFC4648TestVector2() {
//        assert(encoder: sut, encodes: "foob", to: "MZXW6YQ=")
//    }
//
//
//    func test_encode_RFC4648TestVector3() {
//        assert(encoder: sut, encodes: "fooba", to: "MZXW6YTB")
//    }
//
//
//    func test_encode_RFC4648TestVector4() {
//        assert(encoder: sut, encodes: "foobar", to: "MZXW6YTBOI======")
//    }
//
//    func test_encode_shortPhrase() {
//        assert(encoder: sut, encodes: "THIS IS THE HOUSE THAT JACK BUILT",
//               to: "KREESUZAJFJSAVCIIUQEQT2VKNCSAVCIIFKCASSBINFSAQSVJFGFI===")
//    }
//
//    func test_encode_LongerPhrase() {
//        assert(encoder: sut, encodes: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
//               to: "JRXXEZLNEBUXA43VNUQGI33MN5ZCA43JOQQGC3LFOQWCAY3PNZZWKY3UMV2HK4RAMFSGS4DJONUWG2LOM4QGK3DJOQWCA43FMQQGI3ZAMVUXK43NN5SCA5DFNVYG64RANFXGG2LENFSHK3TUEB2XIIDMMFRG64TFEBSXIIDEN5WG64TFEBWWCZ3OMEQGC3DJOF2WCLRAKV2CAZLONFWSAYLEEBWWS3TJNUQHMZLONFQW2LBAOF2WS4ZANZXXG5DSOVSCAZLYMVZGG2LUMF2GS33OEB2WY3DBNVRW6IDMMFRG64TJOMQG42LTNEQHK5BAMFWGS4LVNFYCAZLYEBSWCIDDN5WW233EN4QGG33OONSXC5LBOQXCARDVNFZSAYLVORSSA2LSOVZGKIDEN5WG64RANFXCA4TFOBZGK2DFNZSGK4TJOQQGS3RAOZXWY5LQORQXIZJAOZSWY2LUEBSXG43FEBRWS3DMOVWSAZDPNRXXEZJAMV2SAZTVM5UWC5BANZ2WY3DBEBYGC4TJMF2HK4ROEBCXQY3FOB2GK5LSEBZWS3TUEBXWGY3BMVRWC5BAMN2XA2LEMF2GC5BANZXW4IDQOJXWSZDFNZ2CYIDTOVXHIIDJNYQGG5LMOBQSA4LVNEQG6ZTGNFRWSYJAMRSXGZLSOVXHIIDNN5WGY2LUEBQW42LNEBUWIIDFON2CA3DBMJXXE5LN")
//    }
    
    fileprivate func assert(encoder: ByteArrayEncoder, encodes input: Data, to output: String,
                            inFile filePath: String = #file,
                            atLine lineNumber: Int = #line,
                            expected: Bool = true) {
        do {
            let encoded = try encoder.encode(bytes: [Byte](input))
            if let string = String(data: Data(encoded), encoding: .ascii) {
                if string != output {
                    recordFailure(withDescription: "got '\(string)', expected '\(output)'",
                        inFile: filePath,
                        atLine: lineNumber,
                        expected: expected)
                }
            } else {
                recordFailure(withDescription: "got data'\(Data(encoded).hexDescription)', expected '\(output.data(using: .ascii)!.hexDescription)'",
                    inFile: filePath,
                    atLine: lineNumber,
                    expected: expected)
            }
        } catch {
            recordFailure(withDescription: "\(error)",
                inFile: filePath,
                atLine: lineNumber,
                expected: expected)
        }
        
    }
    
    fileprivate func assert(encoder: ByteArrayEncoder, encodes input: String, to output: String,
                            inFile filePath: String = #file,
                            atLine lineNumber: Int = #line,
                            expected: Bool = true) {
        assert(encoder: encoder,
               encodes: input.utf8Data,
               to: output,
               inFile: filePath,
               atLine: lineNumber,
               expected: expected)
    }
}

private extension Data {
    var hexDescription: String {
        return self.map { return String(format: "%02hhx", $0) }.joined()
    }
}

private extension String {
    var utf8Data: Data {
        return self.data(using: .utf8)!
    }
}

