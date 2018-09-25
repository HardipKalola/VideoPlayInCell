//
//	LoginData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class LoginData : NSObject, NSCoding{

	var authToken : String!
//    var facebookId : String!
    var facebook_id : String!

	var gender : String!
	var id : String!
	var longLivedToken : String!
	var name : String!
	var profileImage : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		authToken = dictionary["auth_token"] as! String
		facebook_id = dictionary["facebook_id"] as? String
		gender = dictionary["gender"] as? String
		id = dictionary["id"] as? String
		longLivedToken = dictionary["long_lived_token"] as? String
		name = dictionary["name"] as? String
		profileImage = dictionary["profile_image"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if authToken != nil{
			dictionary["auth_token"] = authToken
		}
		if facebook_id != nil{
			dictionary["facebook_id"] = facebook_id
		}
		if gender != nil{
			dictionary["gender"] = gender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if longLivedToken != nil{
			dictionary["long_lived_token"] = longLivedToken
		}
		if name != nil{
			dictionary["name"] = name
		}
		if profileImage != nil{
			dictionary["profile_image"] = profileImage
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the LoginData from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         authToken = aDecoder.decodeObject(forKey: "auth_token") as? String
         facebook_id = aDecoder.decodeObject(forKey: "facebook_id") as? String
         gender = aDecoder.decodeObject(forKey: "gender") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         longLivedToken = aDecoder.decodeObject(forKey: "long_lived_token") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         profileImage = aDecoder.decodeObject(forKey: "profile_image") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if authToken != nil{
			aCoder.encode(authToken, forKey: "auth_token")
		}
		if facebook_id != nil{
			aCoder.encode(facebook_id, forKey: "facebook_id")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if longLivedToken != nil{
			aCoder.encode(longLivedToken, forKey: "long_lived_token")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if profileImage != nil{
			aCoder.encode(profileImage, forKey: "profile_image")
		}

	}

}
