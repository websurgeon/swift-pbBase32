//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//
import Foundation

extension Alphabet {
    
    public static func base32() -> Alphabet {
        return Alphabet([
            "A","B","C","D","E","F","G","H",
            "I","J","K","L","M","N","O","P",
            "Q","R","S","T","U","V","W","X",
            "Y","Z","2","3","4","5","6","7"], padding: "=")
    }

}
