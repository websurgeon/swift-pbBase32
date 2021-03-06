//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Alphabet {
    public let values: [String]
    public let padding: String
    
    public init(_ values: [String], padding: String) {
        self.values = values
        self.padding = padding
    }
    
    public func map(_ byte: Byte) -> [Byte] {
        let char = self.values[Int(byte)]
        let data = char.data(using: .ascii)!
        return [Byte](data)
    }

    public func index(of byte: Byte) -> Int? {
        let char: String = String(bytes: [byte], encoding: .ascii)!
        
        guard let index = self.values.firstIndex(of: char) else {
            return nil
        }
        
        return index
    }
}
