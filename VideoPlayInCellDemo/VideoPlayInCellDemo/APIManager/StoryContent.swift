//
//	StoryContent.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class StoryContent : NSObject, NSCoding{

	var avgRating : String!
	var content : String!
	var createdAt : String!
	var id : String!
	var name : String!
	var status : String!
	var storyCatId : String!
	var updatedAt : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		avgRating = dictionary["avg_rating"] as? String
		content = dictionary["content"] as? String
		createdAt = dictionary["created_at"] as? String
		id = dictionary["id"] as? String
		name = dictionary["name"] as? String
		status = dictionary["status"] as? String
		storyCatId = dictionary["story_cat_id"] as? String
		updatedAt = dictionary["updated_at"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if avgRating != nil{
			dictionary["avg_rating"] = avgRating
		}
		if content != nil{
			dictionary["content"] = content
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		if status != nil{
			dictionary["status"] = status
		}
		if storyCatId != nil{
			dictionary["story_cat_id"] = storyCatId
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
         avgRating = aDecoder.decodeObject(forKey: "avg_rating") as? String
         content = aDecoder.decodeObject(forKey: "content") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         storyCatId = aDecoder.decodeObject(forKey: "story_cat_id") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if avgRating != nil{
			aCoder.encode(avgRating, forKey: "avg_rating")
		}
		if content != nil{
			aCoder.encode(content, forKey: "content")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if storyCatId != nil{
			aCoder.encode(storyCatId, forKey: "story_cat_id")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updated_at")
		}

	}

}