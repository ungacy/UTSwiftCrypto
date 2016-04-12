//
//  UTBase64.swift
//  UTSwiftCrypto
//
//  Created by Tao, Ye(Ye) on 16/4/12.
//  Copyright © 2016年 ungacy. All rights reserved.
//

import Foundation

/**
 Base64 encode and decode
 Inspire from [ericdke/base64.swift](https://gist.github.com/ericdke/1eaed835eef167b9f12c)
 */

public class UTBase64 {

  public class func encodeData(data: NSData) -> String? {
    let base64String = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    return base64String as String
  }

  public class func encode(string: String) -> String? {
    guard let plainData = (string as NSString).dataUsingEncoding(NSUTF8StringEncoding) else {
      return nil
    }
    let base64String = plainData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    return base64String as String
  }

  public class func decode(string: String?) -> NSData? {
    guard let stringValue = string else {
      return nil
    }
    if let decodedData = NSData(base64EncodedString: stringValue, options: NSDataBase64DecodingOptions(rawValue: 0)) {
      return decodedData
    }
    return nil
  }
}
