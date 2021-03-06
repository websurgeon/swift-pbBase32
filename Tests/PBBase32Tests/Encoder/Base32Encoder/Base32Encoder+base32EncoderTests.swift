//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Encoder_base32EncoderTests: XCTestCase {
    var sut: Base32Encoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Encoder.base32Encoder()
    }
    
    func test_alphabet() {
        XCTAssertEqual(sut.alphabet, Alphabet.base32())
    }
    
    func test_testVectors() {
        let vectors = TestVectors.loadTestVectors(type: .base32)
        for vector in vectors {
            let encoded = try! sut.encode(bytes: vector.decoded)
            XCTAssertEqual(encoded, vector.encoded)
        }
    }
    
    func test_invalidBlockSize_shouldBeFatalError() {
        assertFatalError(expectedMessage: "block size must be <= 5 bytes") {
            let input = [Byte]("012345".data(using: .utf8)!)
            _ = self.sut.encodeBlock(input, alphabet: self.sut.alphabet)
        }
    }
}

