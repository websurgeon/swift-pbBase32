//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
import PBBase32

class AlphabetTests: XCTestCase {
    let values = ["a", "b", "c"]
    let padding = "x"
    var sut: Alphabet!
    
    override func setUp() {
        super.setUp()
        
        sut = Alphabet(values, padding: padding)
    }

    func test_values() {
        XCTAssertEqual(sut.values, values)
    }

    func test_padding() {
        XCTAssertEqual(sut.padding, padding)
    }
    
    func test_map_shouldReturnBytesAtIndexEqualToInputByteDecimalValue() {
        for (index, _) in values.enumerated() {
            XCTAssertEqual(sut.map(index.byte), values[index].bytes)
        }
    }

}

private extension Int {
    var byte: Byte {
        return Byte(self)
    }
}

private extension String {
    var bytes: [Byte] {
        return [Byte](self.data(using: .ascii)!)
    }
}

