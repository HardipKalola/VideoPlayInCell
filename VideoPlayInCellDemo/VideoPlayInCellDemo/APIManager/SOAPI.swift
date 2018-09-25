//
//  Copyright © 2018 SOTSYS220. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

let kSecret = "baseCode@secret"
let kPrivateKey = "Hg1dhgKS1A1MT0AI5Pf5ydf7r6vlwgjUfa9s"

private extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

enum SOAPI {
    case guestLogin(params : Dictionary<String, Any>)

    case syncData(params : Dictionary<String, Any>)

    case loginWithFbData(params : Dictionary<String, Any>)

    case logOutData(params : Dictionary<String, Any>)

    case addQuestion(params : Dictionary<String, Any>)

    case updateQuestion(params : Dictionary<String, Any>)

    case deleteQuestion(params : Dictionary<String, Any>)

    case storyRating(params : Dictionary<String, Any>)

    case signUp(params : Dictionary<String, Any>)
    
    case signIn(params : Dictionary<String, String>)
    
    case changePassword(params : Dictionary<String, Any>)
}

extension SOAPI : TargetType {
   
    var baseURL: URL {
//        return URL(string : "http://172.16.16.48/coupleGame/public/index.php/api")!
        return URL(string : "http://couplepartygame.com/api")!
    }
    
    var path: String {
        switch self {
        case .guestLogin:
            return "/guestLogin"
        case .syncData:
            return "/syncAllData"
        case .loginWithFbData:
            return "/signIn/facebook"
        case .logOutData:
            return "/logout/facebook"
        case .addQuestion:
            return "/addQuestion"
        case .updateQuestion:
            return "/updateQuestion"
        case .deleteQuestion:
            return "/deleteQuestion"
        case .storyRating:
            return "/saveStoryRating"
        case .signUp:
            return "oauth/signup"
        case .signIn:
            return "oauth/signin"
        case .changePassword:
            return "user/changepassword"
        }
    }
    
    var method: Moya.Method {
//        switch self {
//        case .signUp, .getUserId:
//            return .get
//        default:
//           return .post
//        }
        
        return .post
    }
    
   
        
    var task: Task {
        switch self {
        case .guestLogin(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        
        case .syncData(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)

        case .loginWithFbData(let params):
            var formData = [MultipartFormData]()
            for (key, value) in params {
                if let imgData = value as? Data {
                    formData.append(MultipartFormData(provider: .data(imgData), name: key, fileName: "1.jpg", mimeType: "image/jpeg"))
                } else {
                    formData.append(MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key))
                }
            }
            return .uploadMultipart(formData)
       
            
        case .logOutData(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .addQuestion(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .updateQuestion(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
         
        case .deleteQuestion(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
         
        case .storyRating(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .signUp(let params):
            var formData = [MultipartFormData]()
            for (key, value) in params {
                if let imgData = value as? Data {
                    formData.append(MultipartFormData(provider: .data(imgData), name: key, fileName: "1.jpg", mimeType: "image/jpeg"))
                } else {
                    formData.append(MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key))
                }
            }
            return .uploadMultipart(formData)
            
        case .signIn(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .changePassword(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        
        }
    }
    
    var headers: [String : String]? {
        
        let nonce = 6.randomString
        let timestamp = self.GetCurrentTimeStamp()
        let token = self.createHashedTokenString(timeStemp: timestamp, randomStr: nonce)
        var authKey = ""
        if (UserDefaults.standard.value(forKey: "kAuthKey") == nil){
            authKey = ""
        }else{
            authKey = UserDefaults.standard.value(forKey: "kAuthKey") as! String
        }
        
//        var authKey = ""
       

        return ["Content-Type":"application/x-www-form-urlencoded",
                "lang":"en",
                "AuthToken":  (authKey != nil) ? authKey : "",
                "nonce":nonce,
                "timestamp":timestamp,
                "token":token]
        /*
        switch self {
        case .signUp, .signIn:
            return ["Content-Type":"application/x-www-form-urlencoded",
                    "lang":"en",
                    "nonce":nonce,
                    "timestamp":timestamp,
                    "token":token]
        default:
            return ["Content-Type":"application/x-www-form-urlencoded",
                    "lang":"en",
                    "vAuthKey":authKey as! String,
                    "nonce":nonce,
                    "timestamp":timestamp,
                    "token":token]
        }*/
    }
    var sampleData: Data { return Data() }

}

extension SOAPI {
    
    //    //MARK: Timestamp
    func GetCurrentTimeStamp() -> String {
        let df = DateFormatter()
        let date = NSDate()
        df.dateFormat = "yyyyMMddhhmmss"
        let NewDate = df.string(from: date as Date)
        return NewDate.replacingOccurrences(of: ":", with: "")
    }
    
    //MARK: Create Token
    func createHashedTokenString(timeStemp : String , randomStr :  String) -> String {
        var str = String(format: "%@=%@&%@=%@","nonce", randomStr, "timestamp",timeStemp)
        
        str = str.appending("|")
        str = str.appending(kSecret)
//        str = str.hmac(algorithm: .SHA256, key:kPrivateKey)
        return str
    }
}


//MARK: CREATE RANDOM STRING of LENGTH
extension Int{
    var randomString : String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: self)
        
        for _ in 0 ..< self{
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        return randomString as String
    }
}
/*
extension String {
    
    func hmac(algorithm: CryptoAlgorithm, key: String) -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = Int(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = algorithm.digestLength
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        let keyStr = key.cString(using: String.Encoding.utf8)
        let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))
        
        CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
        
        let digest = stringFromResult(result: result, length: digestLen)
        
        result.deallocate(capacity: digestLen)
        
        return digest
    }
    
    private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
        let hash = NSMutableString()
        for i in 0..<length {
            hash.appendFormat("%02x", result[i])
        }
        return String(hash)
    }
}


enum CryptoAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    var HMACAlgorithm: CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:      result = kCCHmacAlgMD5
        case .SHA1:     result = kCCHmacAlgSHA1
        case .SHA224:   result = kCCHmacAlgSHA224
        case .SHA256:   result = kCCHmacAlgSHA256
        case .SHA384:   result = kCCHmacAlgSHA384
        case .SHA512:   result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    var digestLength: Int {
        var result: Int32 = 0
        switch self {
        case .MD5:      result = CC_MD5_DIGEST_LENGTH
        case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}
*/
