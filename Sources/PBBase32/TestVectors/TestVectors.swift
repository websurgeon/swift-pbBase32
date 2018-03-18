//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

class TestVectors {
    enum EncodingType {
        case base32
        case base32hex
        
        var fileName: String {
            switch self {
            case .base32: return "TestVectorsBase32"
            case .base32hex: return "TestVectorsBase32hex"
            }
        }
    }
}
