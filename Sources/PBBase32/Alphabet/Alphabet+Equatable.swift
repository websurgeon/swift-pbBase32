//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Alphabet: Equatable {
    public static func ==(lhs: Alphabet, rhs: Alphabet) -> Bool {
        return lhs.values == rhs.values && lhs.padding == rhs.padding
    }
}
