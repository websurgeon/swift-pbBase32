//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

extension Base32DecoderTests {
    
    func assertDecoder(_ decoder: ByteArrayDecoder, passes testVectorName: Base32TestVector,
                       inFile filePath: String = #file,
                       atLine lineNumber: Int = #line) {
        
        let vector = TestVectors.base32[testVectorName]!
        let input = [Byte](vector.encoded.utf8Data)
        let output = vector.decoded
        
        do {
            let result = try decoder.decode(bytes: input)
            
            if let string = String(data: Data(result), encoding: .utf8) {
                if string != output {
                    recordFailure(withDescription: "got '\(string)', expected '\(output)'",
                        inFile: filePath,
                        atLine: lineNumber,
                        expected: true)
                }
            } else {
                recordFailure(withDescription: "got data'\(Data(result).hexDescription)', expected '\(output.utf8Data.hexDescription)'",
                    inFile: filePath,
                    atLine: lineNumber,
                    expected: true)
            }
        } catch {
            recordFailure(withDescription: "\(error)",
                inFile: filePath,
                atLine: lineNumber,
                expected: true)
        }
        
    }
    
}

private extension Data {
    var hexDescription: String {
        return self.map { return String(format: "%02hhx", $0) }.joined()
    }
}

private extension String {
    var utf8Data: Data {
        return self.data(using: .utf8)!
    }
}
