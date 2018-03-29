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

    func test_base32hexEncode_data() {
        let data = Data("This is the house that jack build".utf8)
        
        let encoded = try! base32hexEncode(data: data)
        
        XCTAssertEqual(String(data: encoded, encoding: .ascii),
                       "AHK6ISP0D5PI0T38CKG6GRRLEDII0T38C5Q20QJ1CDLI0OJLD5M68===")
    }


    func test_base32hexEncode_string() {
        let string = "This is the house that jack build"

        let encoded = try! base32hexEncode(string: string)

        XCTAssertEqual(encoded,
                       "AHK6ISP0D5PI0T38CKG6GRRLEDII0T38C5Q20QJ1CDLI0OJLD5M68===")
    }

    func test_base32hexDecode_data() {
        let data = Data("AHK6ISP0D5PI0T38CKG6GRRLEDII0T38C5Q20QJ1CDLI0OJLD5M68===".utf8)

        let decoded = try! base32hexDecode(data: data)

        XCTAssertEqual(String(data: decoded, encoding: .utf8),
                       "This is the house that jack build")
    }

    func test_base32hexDecode_string() {
        let string = "AHK6ISP0D5PI0T38CKG6GRRLEDII0T38C5Q20QJ1CDLI0OJLD5M68==="

        let decoded = try! base32hexDecode(string: string)

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
            ("test_base32hexEncode_data", test_base32hexEncode_data),
            ("test_base32hexEncode_string", test_base32hexEncode_string),
            ("test_base32hexDecode_data", test_base32hexDecode_data),
            ("test_base32hexDecode_string", test_base32hexDecode_string),
        ]
        
    }
}

