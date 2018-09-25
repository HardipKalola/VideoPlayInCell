//
//	UserSetting.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserSetting : NSObject, NSCoding{

	var createdAt : String!
	var id : String!
	var settingId : String!
	var settingValue : String!
	var status : String!
	var updatedAt : String!
	var userId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		createdAt = dictionary["created_at"] as? String
		id = dictionary["id"] as? String
		settingId = dictionary["setting_id"] as? String
		settingValue = dictionary["setting_value"] as? String
		status = dictionary["status"] as? String
		updatedAt = dictionary["updated_at"] as? String
		userId = dictionary["user_id"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if settingId != nil{
			dictionary["setting_id"] = settingId
		}
		if settingValue != nil{
			dictionary["setting_value"] = settingValue
		}
		if status != nil{
			dictionary["status"] = status
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
		}
		if userId != nil{
			dictionary["user_id"] = userId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         settingId = aDecoder.decodeObject(forKey: "setting_id") as? String
         settingValue = aDecoder.decodeObject(forKey: "setting_value") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if settingId != nil{
			aCoder.encode(settingId, forKey: "setting_id")
		}
		if settingValue != nil{
			aCoder.encode(settingValue, forKey: "setting_value")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}