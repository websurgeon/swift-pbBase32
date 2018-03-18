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
    
}
