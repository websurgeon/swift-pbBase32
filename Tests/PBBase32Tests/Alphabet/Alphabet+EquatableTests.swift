//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
import PBBase32

class Alphabet_EquatableTests: XCTestCase {

    func test_whenSameValuesAndPadding() {
        let alphabet = Alphabet(["foo", "bar"], padding: "baz")
        let other = Alphabet(["foo", "bar"], padding: "baz")
        
        XCTAssertEqual(alphabet, other)
    }

    func test_whenHasADifferentValue() {
        let alphabet = Alphabet(["foo", "not bar"], padding: "baz")
        let other = Alphabet(["foo", "bar"], padding: "bazX")
        
        XCTAssertNotEqual(alphabet, other)
    }

    func test_whenDifferentPadding() {
        let alphabet = Alphabet(["foo", "bar"], padding: "baz")
        let other = Alphabet(["foo", "bar"], padding: "bazX")
        
        XCTAssertNotEqual(alphabet, other)
    }

}
