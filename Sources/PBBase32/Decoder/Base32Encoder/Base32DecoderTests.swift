//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32DecoderTests: XCTestCase {
    var sut: ByteArrayDecoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Decoder.decoder()
    }
    
    func test_decode_zeroBytes() {
        assertDecoder(sut, passes: .test_0Byte)
    }
    
    func test_decode_1Byte() {
        assertDecoder(sut, passes: .test_1Byte)
    }

    func test_decode_2Bytes() {
        assertDecoder(sut, passes: .test_2Byte)
    }

    func test_decode_3Bytes() {
        assertDecoder(sut, passes: .test_3Byte)
    }

    func test_decode_4Bytes() {
        assertDecoder(sut, passes: .test_4Byte)
    }

    func test_decode_5Bytes() {
        assertDecoder(sut, passes: .test_5Byte)
    }

    func test_decode_6Byte() {
        assertDecoder(sut, passes: .test_6Byte)
    }

    func test_decode_10Bytes() {
        assertDecoder(sut, passes: .test_10Byte)
    }

    func test_decode_15Bytes() {
        assertDecoder(sut, passes: .test_15Byte)
    }

    func test_decode_RFC4648TestVector1() {
        assertDecoder(sut, passes: .test_RFC4648_Test_Vector_1)
    }

    func test_decode_RFC4648TestVector2() {
        assertDecoder(sut, passes: .test_RFC4648_Test_Vector_2)
    }


    func test_decode_RFC4648TestVector3() {
        assertDecoder(sut, passes: .test_RFC4648_Test_Vector_3)
    }


    func test_decode_RFC4648TestVector4() {
        assertDecoder(sut, passes: .test_RFC4648_Test_Vector_4)
    }

    func test_decode_shortPhrase() {
        assertDecoder(sut, passes: .test_short_phrase)
    }

    func test_decode_LongerPhrase() {
        assertDecoder(sut, passes: .test_longer_phrase)
    }
    
    func test_decode_invalidInputSize() {
        let inputData = "A".data(using: .ascii)!
        XCTAssertThrowsError(try sut.decode(bytes: [Byte](inputData))) { error in
            guard case Base32DecoderError.invalidInput(let size) = error else {
                return XCTFail("expected error")
            }
            XCTAssertEqual(size, 1)
        }
    }
    
    func test_decode_invalidInputByte() {
        let inputData = "GEZDGNBVG$".data(using: .ascii)!
        XCTAssertThrowsError(try sut.decode(bytes: [Byte](inputData))) { error in
            guard case Base32DecoderError.invalidByte(let byte,
                                                      let index,
                                                      let processed) = error else {
                return XCTFail("expected error")
            }
            XCTAssertEqual(byte, [Byte]("$".data(using: .utf8)!)[0])
            XCTAssertEqual(index, 9)
            XCTAssertEqual(processed, "12345".data(using: .utf8)!)
        }
    }
    
}
