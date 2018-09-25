//
//  RequestParameter.swift
//  CodeStructure
//
//  Created by Hitesh on 11/29/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class RequestParameter: NSObject {
    static var instance: RequestParameter!
    
//    var objUser : UserData! = nil
//    let vDeviceToken = UserDefaults.standard[kDeviceToken] as! String

    let vDeviceToken = ""
    let eDeviceType = "1"
    
    // SHARED INSTANCE
    class func sharedInstance() -> RequestParameter {
        self.instance = (self.instance ?? RequestParameter())
        return self.instance
    }
    func guestLoginParam(guestId : String) -> Dictionary<String,String> {
        
        var requestDictionary : Dictionary<String,String> = Dictionary()
        requestDictionary["guest_id"] = guestId;
        requestDictionary["device_token"] = vDeviceToken
        requestDictionary["device_type"] = eDeviceType
        
        print(requestDictionary)
        return requestDictionary
    }
    func syncDataParam(timeStamp : String) -> Dictionary<String,String> {
        
        var requestDictionary : Dictionary<String,String> = Dictionary()
        requestDictionary["last_modified_timestamp"] = timeStamp;
        
        print(requestDictionary)
        return requestDictionary
    }
    func singInWithFacebookParam(vFacebookID : String, vGuestID: String, vLongLivedToken: String, vName: String, vGender: String, vProfile_image: [UIImage]?) -> Dictionary<String,String> {

        var requestDictionary : Dictionary<String, Any> = Dictionary()
        requestDictionary["facebook_id"] = vFacebookID
        requestDictionary["device_token"] = vDeviceToken
        requestDictionary["device_type"] = eDeviceType
        requestDictionary["guest_id"] = vGuestID
        requestDictionary["long_lived_token"] = vLongLivedToken
        requestDictionary["name"] = vName
        requestDictionary["gender"] = vGender

        if vProfile_image != nil {
            for (index, image) in (vProfile_image?.enumerated())! {
                requestDictionary["profile_image[\(index)]"] = UIImageJPEGRepresentation(image, 1.0)
            }
        }
        
        print(requestDictionary)
        return requestDictionary as! Dictionary<String, String>
    }
    func logOutParamAPI(vUserID : String) -> Dictionary<String, String> {
        
        var requestDictionary : Dictionary<String, String> = Dictionary()
        requestDictionary["guest_id"] = vUserID

        
        print(requestDictionary)
        return requestDictionary
    }
    func addQuestionAPI(forWhichGender : String,catID : String,question : String,questionType : String) -> Dictionary<String, String> {
        
        var requestDictionary : Dictionary<String, String> = Dictionary()
        requestDictionary["for_which_gender"] = forWhichGender
        requestDictionary["cat_id"] = catID
        requestDictionary["question"] = question
        requestDictionary["question_type"] = questionType
        
        print(requestDictionary)
        return requestDictionary
    }
    func updatedQuestionAPI(question_id : String,forWhichGender : String,catID : String,question : String,questionType : String) -> Dictionary<String, String> {
        
        var requestDictionary : Dictionary<String, String> = Dictionary()
        requestDictionary["question_id"] = question_id
        requestDictionary["for_which_gender"] = forWhichGender
        requestDictionary["cat_id"] = catID
        requestDictionary["question"] = question
        requestDictionary["question_type"] = questionType
        
        
        print(requestDictionary)
        return requestDictionary
    }
    func deleteQuestionAPI(question_id : String,forWhichGender : String,catID : String,question : String,questionType : String) -> Dictionary<String, String> {
        
        var requestDictionary : Dictionary<String, String> = Dictionary()
        requestDictionary["question_id"] = question_id
        print(requestDictionary)
        return requestDictionary
    }
    func saveStoryRatings(story_id : String,rating : String) -> Dictionary<String, String> {
        
        var requestDictionary : Dictionary<String, String> = Dictionary()
        requestDictionary["story_id"] = story_id
        requestDictionary["rating"] = rating
        
        print(requestDictionary)
        return requestDictionary
    }
    func signUpParam(vUserName : String, vFirstName: String, vLastName: String, vEmailId: String, vPassword: String, images: [UIImage]?) -> Dictionary<String, Any> {
        var requestDictionary : Dictionary<String, Any> = Dictionary()
        requestDictionary["vUserName"] = vUserName
        requestDictionary["vFirstName"] = vFirstName
        requestDictionary["vLastName"] = vLastName
        requestDictionary["vEmailId"] = vEmailId
        requestDictionary["vPassword"] = vPassword
        requestDictionary["vDeviceToken"] = vDeviceToken
        requestDictionary["eDeviceType"] = eDeviceType
        
        if images != nil {
            for (index, image) in (images?.enumerated())! {
                requestDictionary["vMediaName[\(index)]"] = UIImageJPEGRepresentation(image, 1.0)
            }
        }
        return requestDictionary
    }
    
    func loginParam(email : String, password: String) -> Dictionary<String,String> {
        
        var requestDictionary : Dictionary<String,String> = Dictionary()
        requestDictionary["vEmailId"] = email;
        requestDictionary["vPassword"] = password
        requestDictionary["vDeviceToken"] = vDeviceToken
        requestDictionary["eDeviceType"] = eDeviceType

        print(requestDictionary)
        return requestDictionary
    }
    
    func changePasswordParam(newPassword : String, oldPassword: String) -> Dictionary<String,String> {
        
        var requestDictionary : Dictionary<String,String> = Dictionary()
        requestDictionary["vPassword"] = newPassword;
        requestDictionary["vOldPassword"] = oldPassword
        requestDictionary["vDeviceToken"] = vDeviceToken
        requestDictionary["eDeviceType"] = eDeviceType
        
        print(requestDictionary)
        return requestDictionary
    }
    func getCurrentTimeStampForAPI() -> String {
        let df = DateFormatter()
        let date = NSDate()
        df.dateFormat = "yyyyMMddhhmmss"
        let NewDate = df.string(from: date as Date)
        return NewDate.replacingOccurrences(of: ":", with: "")
    }
    
}

