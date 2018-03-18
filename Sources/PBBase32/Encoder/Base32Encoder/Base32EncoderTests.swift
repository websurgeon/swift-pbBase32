//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32EncoderTests: XCTestCase {
    
    func test_alphabet() {
        let alphabet = Alphabet(["foo", "bar"], padding: "baz")
        
        let sut = Base32Encoder(alphabet: alphabet)
        
        XCTAssertEqual(sut.alphabet, alphabet)
    }
    
    func test_base32Encoder_shouldUseBase32Alphabet() {
        let sut = Base32Encoder.base32Encoder()
        
        XCTAssertEqual(sut.alphabet, Alphabet.base32())
    }
}

