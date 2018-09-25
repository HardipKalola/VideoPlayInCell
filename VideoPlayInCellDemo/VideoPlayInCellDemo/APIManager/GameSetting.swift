//
//	GameSetting.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class GameSetting : NSObject, NSCoding{

	var createdAt : String!
	var defaultValue : String!
	var id : String!
	var settingName : String!
	var status : String!
	var updatedAt : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		createdAt = dictionary["created_at"] as? String
		defaultValue = dictionary["default_value"] as? String
		id = dictionary["id"] as? String
		settingName = dictionary["setting_name"] as? String
		status = dictionary["status"] as? String
		updatedAt = dictionary["updated_at"] as? String
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
		if defaultValue != nil{
			dictionary["default_value"] = defaultValue
		}
		if id != nil{
			dictionary["id"] = id
		}
		if settingName != nil{
			dictionary["setting_name"] = settingName
		}
		if status != nil{
			dictionary["status"] = status
		}
		if updatedAt != nil{
			dictionary["updated_at"] = updatedAt
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
         defaultValue = aDecoder.decodeObject(forKey: "default_value") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         settingName = aDecoder.decodeObject(forKey: "setting_name") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

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
		if defaultValue != nil{
			aCoder.encode(defaultValue, forKey: "default_value")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if settingName != nil{
			aCoder.encode(settingName, forKey: "setting_name")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}