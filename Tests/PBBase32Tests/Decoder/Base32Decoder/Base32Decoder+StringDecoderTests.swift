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
    
    func test_decode_nonAsciiInput_shouldThrowError() {
        let nonAsciiInput = "dogface 🐶"
        
        XCTAssertThrowsError(try sut.decode(string: nonAsciiInput)) { error in
            guard case Base32DecoderError.notAsciiInput = error else {
                return XCTFail("expected error")
            }
        }
    }
    
}
