//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
import PBBase32

class PBBase32Tests: XCTestCase {
    
    func test_base32Encode_data() {
        let data = "This is the house that jack build".data(using: .utf8)!

        let encoded = try! base32Encode(data: data)
        
        XCTAssertEqual(String(data: encoded, encoding: .ascii),
                       "KRUGS4ZANFZSA5DIMUQGQ33VONSSA5DIMF2CA2TBMNVSAYTVNFWGI===")
    }
    
    func test_base32Encode_string() {
        let string = "This is the house that jack build"
        
        let encoded = try! base32Encode(string: string)
        
        XCTAssertEqual(encoded,
                       "KRUGS4ZANFZSA5DIMUQGQ33VONSSA5DIMF2CA2TBMNVSAYTVNFWGI===")
    }
}
