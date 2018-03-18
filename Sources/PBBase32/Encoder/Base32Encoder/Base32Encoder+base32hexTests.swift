//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Encoder_base32hexTests: XCTestCase {
    var sut: ByteArrayEncoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Encoder.base32hexEncoder()
    }
    
    func test_testVectors() {
        let vectors = TestVectors.loadTestVectors(type: .base32hex)
        for vector in vectors {
            let bytes = vector.decoded.utf8Bytes
            let encoded = try! sut.encode(bytes: [Byte](bytes))
            let string = Data(encoded).asciiString
            XCTAssertEqual(string, vector.encoded)
        }
    }
    
    
}

private extension String {
    var utf8Bytes: [Byte] {
        return [Byte](self.data(using: .utf8)!)
    }
}

private extension Data {
    var asciiString: String {
        return String(data: self, encoding: .ascii)!
    }
}



