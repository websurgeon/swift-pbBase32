//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Decoder_StringDecoderTests: XCTestCase {
    var sut: StringDecoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Decoder.base32Decoder()
    }
    
    func test_testVectors() {
        let vectors = TestVectors.loadTestVectors(type: .base32)
        for vector in vectors {
            let input = Data(vector.encoded).utf8String
            let expected = Data(vector.decoded).utf8String

            let decoded = try! sut.decode(string: input)
            
            XCTAssertEqual(decoded, expected)
        }
    }
    
    func test_decode_nonAsciiInput_shouldThrowError() {
        let nonAsciiInput = "dogface 🐶"
        
        XCTAssertThrowsError(try sut.decode(string: nonAsciiInput)) { error in
            guard case Base32DecoderError.notAsciiInput = error else {
                return XCTFail("expected error")
            }
        }
    }
    
}

private extension Data {
    var utf8String: String {
        return String(data: self, encoding: .utf8)!
    }
}
