//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public typealias Byte = UInt8

public func base32Encode(data: Data) throws -> Data {
    return try Base32Encoder.encoder().encode(data: data)
}
