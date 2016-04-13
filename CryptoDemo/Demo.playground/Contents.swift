//: Playground - noun: a place where people can play

import UIKit
import UTSwiftCrypto

let foo = "1"
let encodedFoo = UTBase64.encode(foo)
if let encodedData = encodedFoo {
    let decodedFoo = UTBase64.decode(encodedData)
}
let message = "message"
let key = "keyyyyyyyyyyyyyy"

let encrypt = try UTAES.aesEncrypt(message, key: key)
let decrypt = try UTAES.aesDecrypt(encrypt!, key: key)

