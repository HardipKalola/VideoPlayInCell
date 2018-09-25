//
//	SyncData.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class SyncData : NSObject, NSCoding{

	var gameSettings : [GameSetting]!
	var questionCategories : [QuestionCategory]!
	var questions : [Question]!
	var storyCategories : [QuestionCategory]!
	var storyContents : [StoryContent]!
	var syncLogs : [SyncLog]!
	var userSettings : UserSetting!
	var wheelOfFortune : [WheelOfFortune]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		gameSettings = [GameSetting]()
		if let gameSettingsArray = dictionary["game_settings"] as? [[String:Any]]{
			for dic in gameSettingsArray{
				let value = GameSetting(fromDictionary: dic)
				gameSettings.append(value)
			}
		}
		questionCategories = [QuestionCategory]()
		if let questionCategoriesArray = dictionary["question_categories"] as? [[String:Any]]{
			for dic in questionCategoriesArray{
				let value = QuestionCategory(fromDictionary: dic)
				questionCategories.append(value)
			}
		}
		questions = [Question]()
		if let questionsArray = dictionary["questions"] as? [[String:Any]]{
			for dic in questionsArray{
				let value = Question(fromDictionary: dic)
				questions.append(value)
			}
		}
		storyCategories = [QuestionCategory]()
		if let storyCategoriesArray = dictionary["story_categories"] as? [[String:Any]]{
			for dic in storyCategoriesArray{
				let value = QuestionCategory(fromDictionary: dic)
				storyCategories.append(value)
			}
		}
		storyContents = [StoryContent]()
		if let storyContentsArray = dictionary["story_contents"] as? [[String:Any]]{
			for dic in storyContentsArray{
				let value = StoryContent(fromDictionary: dic)
				storyContents.append(value)
			}
		}
		syncLogs = [SyncLog]()
		if let syncLogsArray = dictionary["sync_logs"] as? [[String:Any]]{
			for dic in syncLogsArray{
				let value = SyncLog(fromDictionary: dic)
				syncLogs.append(value)
			}
		}
		if let userSettingsData = dictionary["user_settings"] as? [String:Any]{
			userSettings = UserSetting(fromDictionary: userSettingsData)
		}
		wheelOfFortune = [WheelOfFortune]()
		if let wheelOfFortuneArray = dictionary["wheel_of_fortune"] as? [[String:Any]]{
			for dic in wheelOfFortuneArray{
				let value = WheelOfFortune(fromDictionary: dic)
				wheelOfFortune.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if gameSettings != nil{
			var dictionaryElements = [[String:Any]]()
			for gameSettingsElement in gameSettings {
				dictionaryElements.append(gameSettingsElement.toDictionary())
			}
			dictionary["game_settings"] = dictionaryElements
		}
		if questionCategories != nil{
			var dictionaryElements = [[String:Any]]()
			for questionCategoriesElement in questionCategories {
				dictionaryElements.append(questionCategoriesElement.toDictionary())
			}
			dictionary["question_categories"] = dictionaryElements
		}
		if questions != nil{
			var dictionaryElements = [[String:Any]]()
			for questionsElement in questions {
				dictionaryElements.append(questionsElement.toDictionary())
			}
			dictionary["questions"] = dictionaryElements
		}
		if storyCategories != nil{
			var dictionaryElements = [[String:Any]]()
			for storyCategoriesElement in storyCategories {
				dictionaryElements.append(storyCategoriesElement.toDictionary())
			}
			dictionary["story_categories"] = dictionaryElements
		}
		if storyContents != nil{
			var dictionaryElements = [[String:Any]]()
			for storyContentsElement in storyContents {
				dictionaryElements.append(storyContentsElement.toDictionary())
			}
			dictionary["story_contents"] = dictionaryElements
		}
		if syncLogs != nil{
			var dictionaryElements = [[String:Any]]()
			for syncLogsElement in syncLogs {
				dictionaryElements.append(syncLogsElement.toDictionary())
			}
			dictionary["sync_logs"] = dictionaryElements
		}
		if userSettings != nil{
			dictionary["user_settings"] = userSettings.toDictionary()
		}
		if wheelOfFortune != nil{
			var dictionaryElements = [[String:Any]]()
			for wheelOfFortuneElement in wheelOfFortune {
				dictionaryElements.append(wheelOfFortuneElement.toDictionary())
			}
			dictionary["wheel_of_fortune"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         gameSettings = aDecoder.decodeObject(forKey :"game_settings") as? [GameSetting]
         questionCategories = aDecoder.decodeObject(forKey :"question_categories") as? [QuestionCategory]
         questions = aDecoder.decodeObject(forKey :"questions") as? [Question]
         storyCategories = aDecoder.decodeObject(forKey :"story_categories") as? [QuestionCategory]
         storyContents = aDecoder.decodeObject(forKey :"story_contents") as? [StoryContent]
         syncLogs = aDecoder.decodeObject(forKey :"sync_logs") as? [SyncLog]
         userSettings = aDecoder.decodeObject(forKey: "user_settings") as? UserSetting
         wheelOfFortune = aDecoder.decodeObject(forKey :"wheel_of_fortune") as? [WheelOfFortune]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if gameSettings != nil{
			aCoder.encode(gameSettings, forKey: "game_settings")
		}
		if questionCategories != nil{
			aCoder.encode(questionCategories, forKey: "question_categories")
		}
		if questions != nil{
			aCoder.encode(questions, forKey: "questions")
		}
		if storyCategories != nil{
			aCoder.encode(storyCategories, forKey: "story_categories")
		}
		if storyContents != nil{
			aCoder.encode(storyContents, forKey: "story_contents")
		}
		if syncLogs != nil{
			aCoder.encode(syncLogs, forKey: "sync_logs")
		}
		if userSettings != nil{
			aCoder.encode(userSettings, forKey: "user_settings")
		}
		if wheelOfFortune != nil{
			aCoder.encode(wheelOfFortune, forKey: "wheel_of_fortune")
		}

	}

}
