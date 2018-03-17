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
    
    public static func base32() -> Alphabet {
        return Alphabet([
            "A","B","C","D","E","F","G","H",
            "I","J","K","L","M","N","O","P",
            "Q","R","S","T","U","V","W","X",
            "Y","Z","2","3","4","5","6","7"], padding: "=")
    }
    
    public func map(_ byte: Byte) -> [Byte] {
        let char = self.values[Int(byte)]
        let data = char.data(using: .ascii)!
        return [Byte](data)
    }

    public func index(of byte: Byte) -> Int? {
        guard let char: String = String(bytes: [byte], encoding: .ascii) else {
            return nil
        }
        
        guard let index = self.values.index(of: char) else {
            return nil
        }
        
        return index
    }
}
