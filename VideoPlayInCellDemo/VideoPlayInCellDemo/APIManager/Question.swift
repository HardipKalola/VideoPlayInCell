//
//	Question.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Question : NSObject, NSCoding{

	var catId : String!
	var createdAt : String!
	var forWhichGender : String!
	var id : String!
	var question : String!
	var questionType : String!
	var status : String!
	var updatedAt : String!
	var userId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		catId = dictionary["cat_id"] as? String
		createdAt = dictionary["created_at"] as? String
		forWhichGender = dictionary["for_which_gender"] as? String
		id = dictionary["id"] as? String
		question = dictionary["question"] as? String
		questionType = dictionary["question_type"] as? String
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
		if catId != nil{
			dictionary["cat_id"] = catId
		}
		if createdAt != nil{
			dictionary["created_at"] = createdAt
		}
		if forWhichGender != nil{
			dictionary["for_which_gender"] = forWhichGender
		}
		if id != nil{
			dictionary["id"] = id
		}
		if question != nil{
			dictionary["question"] = question
		}
		if questionType != nil{
			dictionary["question_type"] = questionType
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
         catId = aDecoder.decodeObject(forKey: "cat_id") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         forWhichGender = aDecoder.decodeObject(forKey: "for_which_gender") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         question = aDecoder.decodeObject(forKey: "question") as? String
         questionType = aDecoder.decodeObject(forKey: "question_type") as? String
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
		if catId != nil{
			aCoder.encode(catId, forKey: "cat_id")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "created_at")
		}
		if forWhichGender != nil{
			aCoder.encode(forWhichGender, forKey: "for_which_gender")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if question != nil{
			aCoder.encode(question, forKey: "question")
		}
		if questionType != nil{
			aCoder.encode(questionType, forKey: "question_type")
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
