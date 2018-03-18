//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Decoder_base32hexDecoderTests: XCTestCase {
    var sut: ByteArrayDecoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Decoder.base32hexDecoder()
    }
    
    func test_testVectors() {
        let vectors = TestVectors.loadTestVectors(type: .base32hex)
        for vector in vectors {
            let decoded = try! sut.decode(bytes: vector.encoded)
            XCTAssertEqual(decoded, vector.decoded)
        }
    }
    
}
