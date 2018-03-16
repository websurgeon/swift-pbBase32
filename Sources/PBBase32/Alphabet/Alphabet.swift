//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Alphabet {
    public let values: [String]
    public let padding: String
    
    public init(_ alphabet: [String], padding: String) {
        self.values = alphabet
        self.padding = padding
    }
    
    public static func base32() -> Alphabet {
        return Alphabet([
            "A","B","C","D","E","F","G","H",
            "I","J","K","L","M","N","O","P",
            "Q","R","S","T","U","V","W","X",
            "Y","Z","2","3","4","5","6","7"], padding: "=")
    }
    
}
