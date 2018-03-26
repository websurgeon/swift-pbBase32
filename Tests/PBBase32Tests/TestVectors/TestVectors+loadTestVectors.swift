//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//
import Foundation

extension TestVectors {
    static func loadTestVectors(type: EncodingType) -> [ TestVector ] {
        let jsonObject: Any
        switch type {
        case .base32:
            jsonObject = TestVectors.base32JSONObject
        case .base32hex:
            jsonObject = TestVectors.base32hexJSONObject
        }
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: [])
        let decoder = JSONDecoder()
        return try! decoder.decode([TestVector].self, from: jsonData)
    }
}

