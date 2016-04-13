//
//  UTSHA.swift
//  UTSwiftCrypto
//
//  Created by Tao, Ye(Ye) on 16/4/13.
//  Copyright © 2016年 ungacy. All rights reserved.
//

import CommonCrypto

class UTSHA: NSObject {
  class func SHA256Hash(data: NSData) -> NSData {
    var hash = [UInt8](count: Int(CC_SHA256_DIGEST_LENGTH), repeatedValue: 0)
    CC_SHA256(data.bytes, CC_LONG(data.length), &hash)
    let result = NSData(bytes: hash, length: Int(CC_SHA256_DIGEST_LENGTH))
    return result
  }
}
