//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

class Base32EncoderTests: XCTestCase {
    var sut: ByteArrayEncoder!
    
    override func setUp() {
        super.setUp()
        sut = Base32Encoder.encoder()
    }
    
    func test_encode_zeroBytes() {
        assertEncoder(sut, passes: .test_0Byte)
    }
    
    func test_encode_1Byte() {
        assertEncoder(sut, passes: .test_1Byte)
    }
    
    func test_encode_2Bytes() {
        assertEncoder(sut, passes: .test_2Byte)
    }
    
    func test_encode_3Bytes() {
        assertEncoder(sut, passes: .test_3Byte)
    }
    
    func test_encode_4Bytes() {
        assertEncoder(sut, passes: .test_4Byte)
    }
    
    func test_encode_5Bytes() {
        assertEncoder(sut, passes: .test_5Byte)
    }
    
    func test_encode_6Byte() {
        assertEncoder(sut, passes: .test_6Byte)
    }
    
    func test_encode_10Bytes() {
        assertEncoder(sut, passes: .test_10Byte)
    }
    
    func test_encode_15Bytes() {
        assertEncoder(sut, passes: .test_15Byte)
    }
    
    func test_encode_RFC4648TestVector1() {
        assertEncoder(sut, passes: .test_RFC4648_Test_Vector_1)
    }
    
    func test_encode_RFC4648TestVector2() {
        assertEncoder(sut, passes: .test_RFC4648_Test_Vector_2)
    }
    
    
    func test_encode_RFC4648TestVector3() {
        assertEncoder(sut, passes: .test_RFC4648_Test_Vector_3)
    }
    
    
    func test_encode_RFC4648TestVector4() {
        assertEncoder(sut, passes: .test_RFC4648_Test_Vector_4)
    }
    
    func test_encode_shortPhrase() {
        assertEncoder(sut, passes: .test_short_phrase)
    }
    
    func test_encode_LongerPhrase() {
        assertEncoder(sut, passes: .test_longer_phrase)
    }
    
    
}

