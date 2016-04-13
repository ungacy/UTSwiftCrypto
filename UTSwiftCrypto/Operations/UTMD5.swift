//
//  UTMD5.swift
//  UTSwiftCrypto
//
//  Created by Tao, Ye(Ye) on 16/4/13.
//  Copyright © 2016年 ungacy. All rights reserved.
//

import CommonCrypto

public class UTMD5 {
  public class func md5(message: String) -> String {
    let data: NSData! = (message as NSString).dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    let result = NSMutableData(length: Int(CC_MD5_DIGEST_LENGTH))!
    CC_MD5(data.bytes, CC_LONG(data.length), UnsafeMutablePointer<UInt8>(result.mutableBytes))
    var string = String()
    for i in UnsafeBufferPointer<UInt8>(start: UnsafeMutablePointer<UInt8>(result.bytes), count: result.length) {
      string += NSString(format:"%02x", Int(i)) as String
    }
    return string
  }
}
