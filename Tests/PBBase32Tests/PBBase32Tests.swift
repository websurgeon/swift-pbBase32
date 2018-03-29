//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
import PBBase32

class PBBase32Tests: XCTestCase {
    
    func test_base32Encode_data() {
        let data = Data("This is the house that jack build".utf8)

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
    
    func test_base32Decode_data() {
        let data = Data("KRUGS4ZANFZSA5DIMUQGQ33VONSSA5DIMF2CA2TBMNVSAYTVNFWGI===".utf8)
        
        let decoded = try! base32Decode(data: data)
        
        XCTAssertEqual(String(data: decoded, encoding: .utf8),
                       "This is the house that jack build")
    }
    
    func test_base32Decode_string() {
        let string = "KRUGS4ZANFZSA5DIMUQGQ33VONSSA5DIMF2CA2TBMNVSAYTVNFWGI==="
        
        let decoded = try! base32Decode(string: string)
        
        XCTAssertEqual(decoded, "This is the house that jack build")
    }
}

extension PBBase32Tests {
    static var allTests : [(String, (PBBase32Tests) -> () throws -> Void)] {
        return [
            ("test_base32Encode_data", test_base32Encode_data),
            ("test_base32Encode_string", test_base32Encode_string),
            ("test_base32Decode_data", test_base32Decode_data),
            ("test_base32Decode_string", test_base32Decode_string),
        ]
        
    }
}

