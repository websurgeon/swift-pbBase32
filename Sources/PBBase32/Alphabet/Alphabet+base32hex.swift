//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//
import Foundation

extension Alphabet {
    
    public static func base32hex() -> Alphabet {
        return Alphabet([
            "0","1","2","3","4","5","6","7",
            "8","9","A","B","C","D","E","F",
            "G","H","I","J","K","L","M","N",
            "O","P","Q","R","S","T","U","V"], padding: "=")
    }
    
}

