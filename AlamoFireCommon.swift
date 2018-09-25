

import Foundation
import Alamofire
import ZVProgressHUD




//let BASEURL : String = "http://192.168.1.99:8082/api/user/"
//http://18.188.48.18

let BASEURL : String = "http://18.188.48.18/api/user/"

//"http://www.bacancy.com/btdemo/coinason/api/user/"

func callWebServiceWithURL(methodName: String, withParameter: Parameters, completion: @escaping (([String: AnyObject]) -> Void ))
{
    
    Alamofire.request(BASEURL + methodName, method: .post, parameters: withParameter, encoding: URLEncoding.httpBody).responseJSON { response in
        
        switch response.result {
            
        case .success(let json): break
            
        case .failure(let encodingError ):
            print(encodingError)
            
            if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                
                ZVProgressHUD.show(title: "Connection Failure", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
                
                // no internet connection
                print(err)
            } else {
                // other failures
                ZVProgressHUD.dismiss()
                 ZVProgressHUD.show(title: "Error!", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
            }
            
        }
        
        if let status = response.response?.statusCode {
            switch(status){
            case 201:
                print("example success")
            default:
                print("error with response status: \(status)")
            }
        }
        //to get JSON return value
        if let result = response.result.value {
            let JSON = result as! NSDictionary
            print(JSON)
            completion(JSON as! [String : AnyObject])
        }
        
    }
}

func callWebServiceWithURLWithoutParameterGet(methodName: String, completion: @escaping (([String: AnyObject]) -> Void ))
{
    
    
    Alamofire.request(BASEURL + methodName, method: .get, encoding: URLEncoding.httpBody).responseJSON { response in
        
        switch response.result {
            
        case .success(let json): break
            
        case .failure(let encodingError ):
            print(encodingError)
            
            if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                
                ZVProgressHUD.show(title: "Connection Failure", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
                
                // no internet connection
                print(err)
            } else {
                // other failures
                ZVProgressHUD.dismiss()
                ZVProgressHUD.show(title: "Error!", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
            }
            
        }
        
        if let status = response.response?.statusCode {
            switch(status){
            case 201:
                print("example success")
            default:
                print("error with response status: \(status)")
            }
        }
        //to get JSON return value
        if let result = response.result.value {
            let JSON = result as! NSDictionary
            print(JSON)
            completion(JSON as! [String : AnyObject])
        }
        
//        if let data = response.data {
//            let json = String(data: data, encoding: String.Encoding.utf8)
//            print("Response: \(String(describing: json))")
//
//
//            let responseString  = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
//            completion(responseString)
//
//        }
    }
    
}
func callWebServiceWithURLWithoutParameterPost(methodName: String, completion: @escaping (([String: AnyObject]) -> Void ))
{
    
    
    Alamofire.request(BASEURL + methodName, method: .post, encoding: URLEncoding.httpBody).responseJSON { response in
        
        
        switch response.result {
            
        case .success(let json): break
            
        case .failure(let encodingError ):
            print(encodingError)
            
            if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                
                ZVProgressHUD.show(title: "Connection Failure", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
                
                // no internet connection
                print(err)
            } else {
                // other failures
                ZVProgressHUD.dismiss()
                ZVProgressHUD.show(title: "Error!", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
            }
            
        }
        
        if let data = response.data {
            let json = String(data: data, encoding: String.Encoding.utf8)
            print("Response: \(String(describing: json))")
            
            
            let responseString  = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
            completion(responseString)
            
        }
    }
    
    
    
}


func callGraphAPIWithHeader(time: String,currency: String,signatureKey: String,completion: @escaping ((Array<NSDictionary>) -> Void ))
{
    // let strurl = "https://apiv2.bitcoinaverage.com/indices/global/history/BTCUSD?period=alltime&format=json" as String!
    
    let strurl = "https://apiv2.bitcoinaverage.com/indices/global/history/BTCUSD?since=1405394590" as String!
    
    let headers: HTTPHeaders = [
        "X-signature": signatureKey,
    ]
    print("Headers:",headers)
    
    var JSON : Any = {}
    Alamofire.request(strurl!, method: .get, encoding: URLEncoding.httpBody, headers: headers ).responseJSON { response in
        
        
        switch response.result {
            
        case .success(let json): break
            
        case .failure(let encodingError ):
            print(encodingError)
            
            if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                
                ZVProgressHUD.show(title: "Connection Failure", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
                
                // no internet connection
                print(err)
            } else {
                // other failures
                ZVProgressHUD.dismiss()
                ZVProgressHUD.show(title: "Error!", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
            }
            
        }
        
        if let status = response.response?.statusCode {
            switch(status){
            case 201:
                print("example success")
            default:
                print("error with response status: \(status)")
            }
        }
        //to get JSON return value
        if let result = response.result.value {
            JSON = result as! NSArray
            print(JSON)
            completion(JSON as! Array<NSDictionary>)
        }
        
        
    }
}

func callGraphAPI(time: String,currency: String,completion: @escaping ((Array<NSDictionary>) -> Void ))
{
   // let strurl = "https://apiv2.bitcoinaverage.com/indices/global/history/BTCUSD?period=alltime&format=json" as String!
    
    let strurl = NSString(format:"https://apiv2.bitcoinaverage.com/indices/global/history/%@?period=%@&format=json",currency,time) as String!
    
    var JSON : Any = {}
    Alamofire.request(strurl!, method: .get, encoding: URLEncoding.httpBody).responseJSON { response in
        
        switch response.result {
            
        case .success(let json): break
            
        case .failure(let encodingError ):
            print(encodingError)
            
            if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                
                ZVProgressHUD.show(title: "Connection Failure", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
                
                // no internet connection
                print(err)
            } else {
                // other failures
                ZVProgressHUD.dismiss()
                ZVProgressHUD.show(title: "Error!", state: ZVProgressHUD.StateType.error, on: ZVProgressHUD.DisplayPosition.center)
            }
            
        }
        
        if let status = response.response?.statusCode {
            switch(status){
            case 201:
                print("example success")
            default:
                print("error with response status: \(status)")
            }
        }
        //to get JSON return value
        if let result = response.result.value {
            JSON = result as! NSArray
            print(JSON)
            completion(JSON as! Array<NSDictionary>)
        }
        
        
    }
}
func callWebServiceUploadImage(methodName: String, withParameter: Parameters, imgData: Data, completion: @escaping (([String: AnyObject]) -> Void ))
{
    Alamofire.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(imgData, withName: "image_upload_file",fileName: "file.jpg", mimeType: "image/jpg")
        for (key, value) in withParameter {
            multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            //multipartFormData.append(value as AnyObject.data(using: String.Encoding.utf8)!, withName: key)
        }
    },
                     to: BASEURL + methodName)
    { (result) in
        switch result {
        case .success(let upload, _, _):

            print(result)
            upload.uploadProgress(closure: { (progress) in
                print("Upload Progress: \(progress.fractionCompleted)")
            })

            upload.responseJSON { response in
                print(response)

                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON)
                    completion(JSON as! [String : AnyObject])
                }
                
                print(response.result.value)
            }

        case .failure(let encodingError):
            print(encodingError)
        }
    }
}

func callWebServiceUploadIdentityDoc(methodName: String, withParameter: Parameters, imgData: Data, completion: @escaping (([String: AnyObject]) -> Void ))
{
    Alamofire.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(imgData, withName: "identify_document",fileName: "file.jpg", mimeType: "image/jpg")
        for (key, value) in withParameter {
            multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            //multipartFormData.append(value as AnyObject.data(using: String.Encoding.utf8)!, withName: key)
        }
    },
                     to: BASEURL + methodName)
    { (result) in
        switch result {
        case .success(let upload, _, _):
            
            print(result)
            upload.uploadProgress(closure: { (progress) in
                print("Upload Progress: \(progress.fractionCompleted)")
            })
            
            upload.responseJSON { response in
                print(response)
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON)
                    completion(JSON as! [String : AnyObject])
                }
                
                print(response.result.value)
            }
            
        case .failure(let encodingError):
            print(encodingError)
        }
        
        
        
    }
}
