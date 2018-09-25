//
//	WheelOfFortune.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class WheelOfFortune : NSObject, NSCoding{

	var createdAt : String!
	var forWhichGender : String!
	var id : String!
	var mode : String!
	var option1 : String!
	var option2 : String!
	var status : String!
	var updatedAt : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		createdAt = dictionary["created_at"] as? String
		forWhichGender = dictionary["for_which_gender"] as? String
		id = dictionary["id"] as? String
		mode = dictionary["mode"] as? String
		option1 = dictionary["option1"] as? String
		option2 = dictionary["option2"] as? String
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
		if forWhichGender != nil{
			dictionary["for_which_gender"] = forWhichGender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if mode != nil{
			dictionary["mode"] = mode
		}
		if option1 != nil{
			dictionary["option1"] = option1
		}
		if option2 != nil{
			dictionary["option2"] = option2
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
         forWhichGender = aDecoder.decodeObject(forKey: "for_which_gender") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         mode = aDecoder.decodeObject(forKey: "mode") as? String
         option1 = aDecoder.decodeObject(forKey: "option1") as? String
         option2 = aDecoder.decodeObject(forKey: "option2") as? String
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
		if forWhichGender != nil{
			aCoder.encode(forWhichGender, forKey: "for_which_gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if mode != nil{
			aCoder.encode(mode, forKey: "mode")
		}
		if option1 != nil{
			aCoder.encode(option1, forKey: "option1")
		}
		if option2 != nil{
			aCoder.encode(option2, forKey: "option2")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}