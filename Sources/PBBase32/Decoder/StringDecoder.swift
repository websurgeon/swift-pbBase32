//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public protocol StringDecoder {
    
    func decode(string: String) throws -> String
    
}
