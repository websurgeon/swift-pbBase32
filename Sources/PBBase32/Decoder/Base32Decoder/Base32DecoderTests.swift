//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32DecoderTests: XCTestCase {
    var sut: Base32Decoder!
    
    func test_alphabet() {
        let alphabet = Alphabet(["foo", "bar"], padding: "baz")
        
        let sut = Base32Decoder(alphabet: alphabet)
        
        XCTAssertEqual(sut.alphabet, alphabet)
    }
    
    func test_base32Decoder_shouldUseBase32Alphabet() {
        let sut = Base32Decoder.base32Decoder()
        
        XCTAssertEqual(sut.alphabet, Alphabet.base32())
    }
}
