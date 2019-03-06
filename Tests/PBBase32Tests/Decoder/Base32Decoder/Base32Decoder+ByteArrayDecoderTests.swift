//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Decoder_ByteArrayDecoderTests: XCTestCase {
    var sut: ByteArrayDecoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Decoder.base32Decoder()
    }
    
    func test_decode_invalidInputSize() {
        let inputData = "A".asciiBytes
        XCTAssertThrowsError(try sut.decode(bytes: [Byte](inputData))) { error in
            guard case Base32DecoderError.invalidInputSize(let size) = error else {
                return XCTFail("expected error")
            }
            XCTAssertEqual(size, 1)
        }
    }
    
    func test_decode_invalidInputByte() {
        let inputData = "GEZDGNBVG$".asciiBytes
        XCTAssertThrowsError(try sut.decode(bytes: [Byte](inputData))) { error in
            guard case Base32DecoderError.invalidByte(let byte,
                                                      let index,
                                                      let processedOutput) = error else {
                return XCTFail("expected error")
            }
            XCTAssertEqual(byte, [Byte]("$".utf8Bytes)[0])
            XCTAssertEqual(index, 9)
            XCTAssertEqual(processedOutput, "12345".utf8Bytes)
        }
    }
    
}
