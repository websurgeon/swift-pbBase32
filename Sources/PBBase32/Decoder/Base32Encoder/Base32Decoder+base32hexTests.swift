//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32Decoder_base32hexTests: XCTestCase {
    var sut: ByteArrayDecoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Decoder.base32hexDecoder()
    }
    
    func test_testVectors() {
        let vectors = TestVectors.base32hex
        for vector in vectors {
            let bytes = vector.encoded.asciiBytes
            let decoded = try! sut.decode(bytes: [Byte](bytes))
            let string = Data(decoded).utf8String
            XCTAssertEqual(string, vector.decoded)
        }
    }
    
}

private extension String {
    var utf8Bytes: [Byte] {
        return [Byte](self.data(using: .utf8)!)
    }
    var asciiBytes: [Byte] {
        return [Byte](self.data(using: .ascii)!)
    }
}

private extension Data {
    var utf8String: String {
        return String(data: self, encoding: .utf8)!
    }
}


