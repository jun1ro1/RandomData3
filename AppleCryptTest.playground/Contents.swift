import UIKit

var str = "Hello, playground"
print(str)

let tag = "com.example.keys.mykey".data(using: .utf8)!

let type = kSecAttrKeyTypeRSA
let attributes: [String: Any] =
    [kSecAttrKeyType as String:            type,
     kSecAttrKeySizeInBits as String:      2048,
     kSecPrivateKeyAttrs as String:
        [kSecAttrIsPermanent as String:    true,
         kSecAttrApplicationTag as String: tag]
]

var error: Unmanaged<CFError>?
guard let privateKey = SecKeyCreateRandomKey(attributes as CFDictionary, &error) else {
    print(error)
    throw error!.takeRetainedValue() as Error
}
print(privateKey)
