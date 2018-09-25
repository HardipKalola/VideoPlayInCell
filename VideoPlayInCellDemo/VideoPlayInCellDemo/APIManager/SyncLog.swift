//
//	SyncLog.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SyncLog : NSObject, NSCoding{

	var id : String!
	var lastModifiedTimestamp : String!
	var userId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		id = dictionary["id"] as? String
		lastModifiedTimestamp = dictionary["last_modified_timestamp"] as? String
		userId = dictionary["user_id"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if id != nil{
			dictionary["id"] = id
		}
		if lastModifiedTimestamp != nil{
			dictionary["last_modified_timestamp"] = lastModifiedTimestamp
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
         id = aDecoder.decodeObject(forKey: "id") as? String
         lastModifiedTimestamp = aDecoder.decodeObject(forKey: "last_modified_timestamp") as? String
         userId = aDecoder.decodeObject(forKey: "user_id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastModifiedTimestamp != nil{
			aCoder.encode(lastModifiedTimestamp, forKey: "last_modified_timestamp")
		}
		if userId != nil{
			aCoder.encode(userId, forKey: "user_id")
		}

	}

}