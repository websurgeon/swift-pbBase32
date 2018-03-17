//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

extension Base32EncoderTests {
    
    func assertEncoder(_ encoder: ByteArrayEncoder, passes testVectorName: Base32TestVector,
                inFile filePath: String = #file,
                atLine lineNumber: Int = #line,
                expected: Bool = true) {
        let vector = TestVectors.base32[testVectorName]!
        let input = [Byte](vector.decoded.utf8Data)
        let output = vector.encoded
        
        do {
            let encoded = try encoder.encode(bytes: input)
            
            if let string = String(data: Data(encoded), encoding: .ascii) {
                if string != output {
                    recordFailure(withDescription: "got '\(string)', expected '\(output)'",
                        inFile: filePath,
                        atLine: lineNumber,
                        expected: expected)
                }
            } else {
                recordFailure(withDescription: "got data'\(Data(encoded).hexDescription)', expected '\(output.data(using: .ascii)!.hexDescription)'",
                    inFile: filePath,
                    atLine: lineNumber,
                    expected: expected)
            }
        } catch {
            recordFailure(withDescription: "\(error)",
                inFile: filePath,
                atLine: lineNumber,
                expected: expected)
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
