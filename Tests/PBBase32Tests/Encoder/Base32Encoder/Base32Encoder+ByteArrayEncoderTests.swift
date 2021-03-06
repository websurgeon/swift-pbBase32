//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Encoder_ByteArrayEncoderTests: XCTestCase {
    var sut: ByteArrayEncoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Encoder.base32Encoder()
    }
    
    func test_testVectors() {
        let vectors = TestVectors.loadTestVectors(type: .base32)
        for vector in vectors {
            let encoded = try! sut.encode(bytes: vector.decoded)
            XCTAssertEqual(encoded, vector.encoded)
        }
    }
    
    
}
