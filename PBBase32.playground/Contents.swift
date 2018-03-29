import PBBase32

let encoded = try! base32Encode(string: "testing")

let decoded = try! base32Decode(string: "ORSXG5DJNZTQ====")

let hexEncoded = try! base32hexEncode(string: "testing")

let hexDecoded = try! base32hexDecode(string: "EHIN6T39DPJG====")

