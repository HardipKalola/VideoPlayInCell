//
//  ResponseData.swift
//
//  Created by SOTSYS203 on 20/02/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ResponseData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
//    static let vLastName = "vLastName"
//    static let profileUrl = "profileUrl"
//    static let imageBaseUrl = "imageBaseUrl"
//    static let iUserId = "iUserId"
////    static let vAuthKey = "vAuthKey"
//    static let vFirstName = "vFirstName"
//    static let vEmailId = "vEmailId"
    static let vUserID = "id"
    static let vFacebook_id = "facebook_id"
    static let vName = "name"
    static let vGender = "gender"
    static let vAuthKey = "auth_token"
    static let imageBaseUrl = "imageBaseUrl"
    static let vEmailId = "vEmailId"
    static let vProfileUrl = "profile_image"

  }

  // MARK: Properties
  public var vUserID: String?
  public var vFacebook_id: String?
  public var vName: String?
  public var vGender: String?
  public var vAuthKey: String?
  public var vEmailId: String?
  public var vProfileUrl: String?
    
  public var imageBaseUrl: String?
  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    vUserID = json[SerializationKeys.vUserID].string

    vFacebook_id = json[SerializationKeys.vFacebook_id].string
    vProfileUrl = json[SerializationKeys.vProfileUrl].string

//    if let items = json[SerializationKeys.profileUrl].array { profileUrl = items.map { ProfileUrl(json: $0) } }
    imageBaseUrl = json[SerializationKeys.imageBaseUrl].string
    vName = json[SerializationKeys.vName].string
    vGender = json[SerializationKeys.vGender].string
    vAuthKey = json[SerializationKeys.vAuthKey].string
    vEmailId = json[SerializationKeys.vEmailId].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = vUserID { dictionary[SerializationKeys.vUserID] = value }

    if let value = vFacebook_id { dictionary[SerializationKeys.vFacebook_id] = value }
    if let value = vProfileUrl { dictionary[SerializationKeys.vProfileUrl] = value }

//    if let value = profileUrl { dictionary[SerializationKeys.profileUrl] = value.map { $0.dictionaryRepresentation() } }
    if let value = imageBaseUrl { dictionary[SerializationKeys.imageBaseUrl] = value }
    if let value = vName { dictionary[SerializationKeys.vName] = value }
    if let value = vGender { dictionary[SerializationKeys.vGender] = value }
    if let value = vAuthKey { dictionary[SerializationKeys.vAuthKey] = value }
    if let value = vEmailId { dictionary[SerializationKeys.vEmailId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.vUserID = aDecoder.decodeObject(forKey: SerializationKeys.vUserID) as? String

    self.vFacebook_id = aDecoder.decodeObject(forKey: SerializationKeys.vFacebook_id) as? String
    self.vProfileUrl = aDecoder.decodeObject(forKey: SerializationKeys.vProfileUrl) as? String

//    self.profileUrl = aDecoder.decodeObject(forKey: SerializationKeys.profileUrl) as? [ProfileUrl]
    self.imageBaseUrl = aDecoder.decodeObject(forKey: SerializationKeys.imageBaseUrl) as? String
    self.vName = aDecoder.decodeObject(forKey: SerializationKeys.vName) as? String
    self.vGender = aDecoder.decodeObject(forKey: SerializationKeys.vGender) as? String
    self.vAuthKey = aDecoder.decodeObject(forKey: SerializationKeys.vAuthKey) as? String
    self.vEmailId = aDecoder.decodeObject(forKey: SerializationKeys.vEmailId) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(vUserID, forKey: SerializationKeys.vUserID)

    aCoder.encode(vFacebook_id, forKey: SerializationKeys.vFacebook_id)
    aCoder.encode(vProfileUrl, forKey: SerializationKeys.vProfileUrl)
    aCoder.encode(imageBaseUrl, forKey: SerializationKeys.imageBaseUrl)
    aCoder.encode(vName, forKey: SerializationKeys.vName)
    aCoder.encode(vGender, forKey: SerializationKeys.vGender)
    aCoder.encode(vAuthKey, forKey: SerializationKeys.vAuthKey)
    aCoder.encode(vEmailId, forKey: SerializationKeys.vEmailId)
  }

}
