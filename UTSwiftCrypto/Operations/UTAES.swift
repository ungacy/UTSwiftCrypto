//
//  UTAES.swift
//  UTSwiftCrypto
//
//  Created by Tao, Ye(Ye) on 16/4/12.
//  Copyright © 2016年 ungacy. All rights reserved.
//

import UIKit
import CommonCrypto

public class UTAES: NSObject {

  public class func aesEncrypt(message: String, key: String, iv: String?) throws -> String? {
    let keyData: NSData! = (key as NSString).dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    let keyBytes         = UnsafeMutablePointer<Void>(keyData.bytes)
    let data: NSData! = (message as NSString).dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    let dataLength    = size_t(data.length)
    let dataBytes     = UnsafeMutablePointer<Void>(data.bytes)
    let cryptData    = NSMutableData(length: Int(dataLength) + kCCBlockSizeAES128)
    let cryptPointer = UnsafeMutablePointer<Void>(cryptData!.mutableBytes)
    let cryptLength  = size_t(cryptData!.length)

    let keyLength              = size_t(kCCKeySizeAES128)
    let operation: CCOperation = UInt32(kCCEncrypt)
    let algoritm: CCAlgorithm = UInt32(kCCAlgorithmAES128)
    let options: CCOptions   = UInt32(kCCOptionPKCS7Padding )

    var numBytesEncrypted: size_t = 0

    let cryptStatus = CCCrypt(operation,
                              algoritm,
                              options,
                              keyBytes, keyLength,
                              nil,
                              dataBytes, dataLength,
                              cryptPointer, cryptLength,
                              &numBytesEncrypted)

    if UInt32(cryptStatus) == UInt32(kCCSuccess) {
      cryptData!.length = Int(numBytesEncrypted)
      let base64cryptString = UTBase64.encodeData(cryptData!)
      return base64cryptString
    } else {
      print("Error: \(cryptStatus)")
      return nil
    }
  }

  public class func aesDecrypt(message: String, key: String, iv: String?) throws -> String? {
    let data: NSData! = UTBase64.decode(message)
    let keyData: NSData! = (key as NSString).dataUsingEncoding(NSUTF8StringEncoding) as NSData!
    let keyBytes         = UnsafeMutablePointer<Void>(keyData.bytes)
    let dataLength    = size_t(data.length)
    let dataBytes     = UnsafeMutablePointer<Void>(data.bytes)
    let cryptData    = NSMutableData(length: Int(dataLength) + kCCBlockSizeAES128)
    let cryptPointer = UnsafeMutablePointer<Void>(cryptData!.mutableBytes)
    let cryptLength  = size_t(cryptData!.length)
    let keyLength              = size_t(kCCKeySizeAES128)
    let operation: CCOperation = UInt32(kCCDecrypt)
    let algoritm: CCAlgorithm = UInt32(kCCAlgorithmAES128)
    let options: CCOptions   = UInt32(kCCOptionPKCS7Padding )
    var numBytesEncrypted: size_t = 0

    let cryptStatus = CCCrypt(operation,
                              algoritm,
                              options,
                              keyBytes, keyLength,
                              nil,
                              dataBytes, dataLength,
                              cryptPointer, cryptLength,
                              &numBytesEncrypted)

    if UInt32(cryptStatus) == UInt32(kCCSuccess) {
      cryptData!.length = Int(numBytesEncrypted)
      let actualString = NSString(data: cryptData!, encoding: NSUTF8StringEncoding) as? String
      return actualString
    } else {
      print("Error: \(cryptStatus)")
      return nil
    }
  }
}
