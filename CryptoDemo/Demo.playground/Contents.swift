//: Playground - noun: a place where people can play

import UIKit
import UTSwiftCrypto

let foo = "foo"
let encodedFoo = UTBase64.encode(foo)
if let encodedData = encodedFoo {
    let decodedFoo = UTBase64.decode(encodedData)
}
