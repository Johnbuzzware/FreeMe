//
//  UserModel.swift
//  MyReferral
//
//  Created by vision on 15/05/20.
//  Copyright © 2020 vision. All rights reserved.
//




import UIKit
import CoreLocation
enum UserKeys:String {
    
    
    
    case fullname = "fullname"
    
    case surname = "surname"
    case middlename = "middlename"
    case firstname = "firstname"
    case email = "email"
    case userDOB = "userDOB"
    case authtoken = "authtoken"
    case isLocation = "isLocation"
case blockedChatt = "blockedChatt"
    case imagesArray = "imagesArray"

    
    case address = "address"
    case town = "town"
    case state = "state"
    case postCode = "postCode"
    case postaladdress = "postaladdress"
    case userlat = "userlat"
    case userlon = "userlon"
    case userFriends = "userFriends"

    
    case userType = "userType"
    
    
    case userPhone = "userPhone"
    case homePhone = "homePhone"
    case password = "password"
    case datecompe = "datecompe"
    case empType = "empType"
    case liscnes = "liscnes"
    case whitecard = "whitecard"
    case uniformSize = "uniformSize"
    
    
    case EmergContact = "EmergContact"
    case Name = "Name"
    case AddressEmg = "AddressEmg"
    case mobilNo = "mobilNo"
    case Relationship = "Relationship"
    
    
    case taxNo = "taxNo"
    case superFund = "superFund"
    case memeberNo = "memeberNo"
    case BankBsb = "BankBsb"
    case Bankname = "Bankname"
    case Branch = "Branch"
    case accountNumber = "accountNumber"
    case accName = "accName"
    
    
    case facebookurl = "facebookurl"
    case instaUrl = "instaUrl"
    case xUrl = "xUrl"
    case tikTokUrl = "tikTokUrl"
    case spotifyUrl = "spotifyUrl"
    
    
    
    case createdDate = "createdDate"

    case timeStamp = "timeStamp"
    case imageUrl = "imageUrl"
    case userName = "userName"
    case token = "token"
    case id = "id"
    case abouts = "abouts"
    case flagChats = "flagChats"
    case accountPrivacy = "accountPrivacy"

    
}



class UserModel: GenericDocDictionary,Codable {
    
    
    var isDemo:Bool!
    {
        get{ return boolForKey(key: "isDemo")}
        set{setValue(newValue, forKey: "isDemo")}
    }

    var accountPrivacy:String!
    {
        get{ return stringForKey(key: UserKeys.accountPrivacy.rawValue)}
        set{setValue(newValue, forKey: UserKeys.accountPrivacy.rawValue)}
    }
    var createdDate:Int64!
    {
        get{ return int64ForKey(key: "createdDate")}
        set{setValue(newValue, forKey: "createdDate")}
    }
    
    var datecompe:Int64!
    {
        get{ return int64ForKey(key: "datecompe")}
        set{setValue(newValue, forKey: "datecompe")}
    }
    
    var userlat:Double!
    {
        get{ return doubleForKey(key: UserKeys.userlat.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userlat.rawValue)}
    }
    
    var userlon:Double!
    {
        get{ return doubleForKey(key: UserKeys.userlon.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userlon.rawValue)}
    }
    
    var abouts:String!
    {
        get{ return stringForKey(key: UserKeys.abouts.rawValue)}
        set{setValue(newValue, forKey: UserKeys.abouts.rawValue)}
    }
    
    var imagesArray:[String]!
    {
        get{ return arrayStringForKey(key: UserKeys.imagesArray.rawValue)}
        set{setValue(newValue, forKey: UserKeys.imagesArray.rawValue)}
    }
    var blockedChatt:[String]!
    {
        get{ return arrayStringForKey(key: UserKeys.blockedChatt.rawValue)}
        set{setValue(newValue, forKey: UserKeys.blockedChatt.rawValue)}
    }
    
    var flagChats:[String]!
    {
        get{ return arrayStringForKey(key: UserKeys.flagChats.rawValue)}
        set{setValue(newValue, forKey: UserKeys.flagChats.rawValue)}
    }

    var facebookurl:String!
    {
        get{ return stringForKey(key: UserKeys.facebookurl.rawValue)}
        set{setValue(newValue, forKey: UserKeys.facebookurl.rawValue)}
    }
    
    var instaUrl:String!
    {
        get{ return stringForKey(key: UserKeys.instaUrl.rawValue)}
        set{setValue(newValue, forKey: UserKeys.instaUrl.rawValue)}
    }
    
    var xUrl:String!
    {
        get{ return stringForKey(key: UserKeys.xUrl.rawValue)}
        set{setValue(newValue, forKey: UserKeys.xUrl.rawValue)}
    }
    
    var tikTokUrl:String!
    {
        get{ return stringForKey(key: UserKeys.tikTokUrl.rawValue)}
        set{setValue(newValue, forKey: UserKeys.tikTokUrl.rawValue)}
    }
    
    var spotifyUrl:String!
    {
        get{ return stringForKey(key: UserKeys.spotifyUrl.rawValue)}
        set{setValue(newValue, forKey: UserKeys.spotifyUrl.rawValue)}
    }
    
    
    
    var authtoken:String!
    {
        get{ return stringForKey(key: UserKeys.authtoken.rawValue)}
        set{setValue(newValue, forKey: UserKeys.authtoken.rawValue)}
    }
    
    var EmergContact:String!
    {
        get{ return stringForKey(key: UserKeys.EmergContact.rawValue)}
        set{setValue(newValue, forKey: UserKeys.EmergContact.rawValue)}
    }
    
    var accName:String!
    {
        get{ return stringForKey(key: UserKeys.accName.rawValue)}
        set{setValue(newValue, forKey: UserKeys.accName.rawValue)}
    }
    
    var mobilNo:String!
    {
        get{ return stringForKey(key: UserKeys.mobilNo.rawValue)}
        set{setValue(newValue, forKey: UserKeys.mobilNo.rawValue)}
    }
    
    var Relationship:String!
    {
        get{ return stringForKey(key: UserKeys.Relationship.rawValue)}
        set{setValue(newValue, forKey: UserKeys.Relationship.rawValue)}
    }
    var Name:String!
    {
        get{ return stringForKey(key: UserKeys.Name.rawValue)}
        set{setValue(newValue, forKey: UserKeys.Name.rawValue)}
    }
    
    var userType:String!
    {
        get{ return stringForKey(key: UserKeys.userType.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userType.rawValue)}
    }
    
    
    var AddressEmg:String!
    {
        get{ return stringForKey(key: UserKeys.AddressEmg.rawValue)}
        set{setValue(newValue, forKey: UserKeys.AddressEmg.rawValue)}
    }
    
    var accountNumber:String!
    {
        get{ return stringForKey(key: UserKeys.accountNumber.rawValue)}
        set{setValue(newValue, forKey: UserKeys.accountNumber.rawValue)}
    }
    
    var Branch:String!
    {
        get{ return stringForKey(key: UserKeys.Branch.rawValue)}
        set{setValue(newValue, forKey: UserKeys.Branch.rawValue)}
    }
    
    var Bankname:String!
    {
        get{ return stringForKey(key: UserKeys.Bankname.rawValue)}
        set{setValue(newValue, forKey: UserKeys.Bankname.rawValue)}
    }
    var BankBsb:String!
    {
        get{ return stringForKey(key: UserKeys.BankBsb.rawValue)}
        set{setValue(newValue, forKey: UserKeys.BankBsb.rawValue)}
    }
    
    var memeberNo:String!
    {
        get{ return stringForKey(key: UserKeys.memeberNo.rawValue)}
        set{setValue(newValue, forKey: UserKeys.memeberNo.rawValue)}
    }
    var taxNo:String!
    {
        get{ return stringForKey(key: UserKeys.taxNo.rawValue)}
        set{setValue(newValue, forKey: UserKeys.taxNo.rawValue)}
    }
    
    var superFund:String!
    {
        get{ return stringForKey(key: UserKeys.superFund.rawValue)}
        set{setValue(newValue, forKey: UserKeys.superFund.rawValue)}
    }
    
    
    var timeStamp:Int64!
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    var idd:String!
    {
        get{ return stringForKey(key: UserKeys.id.rawValue)}
        set{setValue(newValue, forKey: UserKeys.id.rawValue)}
    }
    var address:String!
    {
        get{ return stringForKey(key: UserKeys.address.rawValue)}
        set{setValue(newValue, forKey: UserKeys.address.rawValue)}
    }
    var email:String!
    {
        get{ return stringForKey(key: UserKeys.email.rawValue)}
        set{setValue(newValue, forKey: UserKeys.email.rawValue)}
    }
    
    var firstname:String!
    {
        get{ return stringForKey(key: UserKeys.firstname.rawValue)}
        set{setValue(newValue, forKey: UserKeys.firstname.rawValue)}
    }
    
    
    var surname:String!
    {
        get{ return stringForKey(key: UserKeys.surname.rawValue)}
        set{setValue(newValue, forKey: UserKeys.surname.rawValue)}
    }
    
    
    var middlename:String!
    {
        get{ return stringForKey(key: UserKeys.middlename.rawValue)}
        set{setValue(newValue, forKey: UserKeys.middlename.rawValue)}
    }
    
    
    var empType:String!
    {
        get{ return stringForKey(key: UserKeys.empType.rawValue)}
        set{setValue(newValue, forKey: UserKeys.empType.rawValue)}
    }
    
    var postCode:String!
    {
        get{ return stringForKey(key: UserKeys.postCode.rawValue)}
        set{setValue(newValue, forKey: UserKeys.postCode.rawValue)}
    }
    
    var whitecard:String!
    {
        get{ return stringForKey(key: UserKeys.whitecard.rawValue)}
        set{setValue(newValue, forKey: UserKeys.whitecard.rawValue)}
    }
    
    var postaladdress:String!
    {
        get{ return stringForKey(key: UserKeys.postaladdress.rawValue)}
        set{setValue(newValue, forKey: UserKeys.postaladdress.rawValue)}
    }
    
    var state:String!
    {
        get{ return stringForKey(key: UserKeys.state.rawValue)}
        set{setValue(newValue, forKey: UserKeys.state.rawValue)}
    }
    
    
    var liscnes:String!
    {
        get{ return stringForKey(key: UserKeys.liscnes.rawValue)}
        set{setValue(newValue, forKey: UserKeys.liscnes.rawValue)}
    }
    
    var isLocation:Bool!
    {
        get{ return boolForKey(key: UserKeys.isLocation.rawValue)}
        set{setValue(newValue, forKey: UserKeys.isLocation.rawValue)}
    }
    
    var uniformSize:String!
    {
        get{ return stringForKey(key: UserKeys.uniformSize.rawValue)}
        set{setValue(newValue, forKey: UserKeys.uniformSize.rawValue)}
    }
    
    var userToken:String!
    {
        get{ return stringForKey(key: UserKeys.token.rawValue)}
        set{setValue(newValue, forKey: UserKeys.token.rawValue)}
    }
    
    var password:String!
    {
        get{ return stringForKey(key: UserKeys.password.rawValue)}
        set{setValue(newValue, forKey: UserKeys.password.rawValue)}
    }
    
    var imageUrl:String!
    
    {
        get{ return stringForKey(key: UserKeys.imageUrl.rawValue)}
        set{setValue(newValue, forKey: UserKeys.imageUrl.rawValue)}
    }
    
    var homePhone:String!
    {
        get{ return stringForKey(key: UserKeys.homePhone.rawValue)}
        set{setValue(newValue, forKey: UserKeys.homePhone.rawValue)}
    }
    
    var userPhone:String!
    {
        get{ return stringForKey(key: UserKeys.userPhone.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userPhone.rawValue)}
    }
    var userName:String!
    
    {
        get{ return stringForKey(key: UserKeys.userName.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userName.rawValue)}
    }
    
    var userFriends:[String:String]!
    
    {
        get{ return stringDictForKey(key: UserKeys.userFriends.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userFriends.rawValue)}
    }
    
    
    var userDOB:Int64!
    
    {
        get{ return int64ForKey(key: UserKeys.userDOB.rawValue)}
        set{setValue(newValue, forKey: UserKeys.userDOB.rawValue)}
    }
}

enum StoryKeys:String {
    case id = "id"
    case userId = "userId"
    case isActive = "active"
    case mediaUrl = "mediaUrl"
    case mediaType = "mediaType"
    case isSeen = "isSeen"
    case timestamp = "timeStamp"
    
}
class StoryModel: GenericDocDictionary {

    var userId:String!
    {
        get{ return stringForKey(key: StoryKeys.userId.rawValue)}
        set{setValue(newValue, forKey: StoryKeys.userId.rawValue)}
    }
    var isActive:Bool!
    {
        get{ return boolForKey(key: StoryKeys.isActive.rawValue, defaultValue: false)}
        set{setValue(newValue, forKey: StoryKeys.isActive.rawValue)}
    }
    var mediaUrl:String!
    {
        get{ return stringForKey(key: StoryKeys.mediaUrl.rawValue)}
        set{setValue(newValue, forKey: StoryKeys.mediaUrl.rawValue)}
    }
    var mediaType:String!
    {
        get{ return stringForKey(key: StoryKeys.mediaType.rawValue)}
        set{setValue(newValue, forKey: StoryKeys.mediaType.rawValue)}
    }
    var isSeen:[String:Any]!
    {
        get{ return dictForKey(key: StoryKeys.isSeen.rawValue)}
        set{setValue(newValue, forKey: StoryKeys.isSeen.rawValue)}
    }
    var timestamp:Int64!
    {
        get{ return int64ForKey(key: StoryKeys.timestamp.rawValue)}
        set{setValue(newValue, forKey: StoryKeys.timestamp.rawValue)}
    }
}
class StoriesModel{
    var story:StoryModel!
    var user:UserModel!
    init(story:StoryModel? = nil,user:UserModel? = nil){
        self.story = story
        self.user = user
    }
}
class UserStoryModel{
    var story:[StoryModel]!
    var user:UserModel!
    init(story:[StoryModel]? = nil,user:UserModel? = nil){
        self.story = story
        self.user = user
    }
}



class ParticepentsModel: GenericDocDictionary {

    var participants:[String:Any]
    {
        get{ return dictForKey(key: "participants")}
        set{setValue(newValue, forKey: "participants")}
    }
}

class TimeSheetModel: GenericDocDictionary,Codable {
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    var status:String
    {
        get{ return stringForKey(key: "status")}
        set{setValue(newValue, forKey: "status")}
    }
    var descriptionDetails:String
    {
        get{ return stringForKey(key: "descriptionDetails")}
        set{setValue(newValue, forKey: "descriptionDetails")}
    }
    
    var timeSheetDate:Int64
    {
        get{ return int64ForKey(key: "timeSheetDate")}
        set{setValue(newValue, forKey: "timeSheetDate")}
    }
    
    var startTime:Int64
    {
        get{ return int64ForKey(key: "startTime")}
        set{setValue(newValue, forKey: "startTime")}
    }
    
    var endTime:Int64
    {
        get{ return int64ForKey(key: "endTime")}
        set{setValue(newValue, forKey: "endTime")}
    }
    
    var BreakTime:Int64
    {
        get{ return int64ForKey(key: "BreakTime")}
        set{setValue(newValue, forKey: "BreakTime")}
    }
    var isApprove:Bool
    {
        get{ return boolForKey(key: "isApprove")}
        set{setValue(newValue, forKey: "isApprove")}
    }
    
}



class PostModel: GenericDocDictionary,Codable {
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    var textDetails:String
    {
        get{ return stringForKey(key: "textDetails")}
        set{setValue(newValue, forKey: "textDetails")}
    }
    var imageUrl:String
    {
        get{ return stringForKey(key: "imageUrl")}
        set{setValue(newValue, forKey: "imageUrl")}
    }
    
    var createdDate:Int64
    {
        get{ return int64ForKey(key: "createdDate")}
        set{setValue(newValue, forKey: "createdDate")}
    }
    var userImage:String
    {
        get{ return stringForKey(key: "userImage")}
        set{setValue(newValue, forKey: "userImage")}
    }
    var userName:String
    {
        get{ return stringForKey(key: "userName")}
        set{setValue(newValue, forKey: "userName")}
    }
}

class leaveModel: GenericDocDictionary,Codable {
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    var status:String
    {
        get{ return stringForKey(key: "status")}
        set{setValue(newValue, forKey: "status")}
    }
    var reasonLeave:String
    {
        get{ return stringForKey(key: "reasonLeave")}
        set{setValue(newValue, forKey: "reasonLeave")}
    }
    
    var leaveDate:Int64
    {
        get{ return int64ForKey(key: "leaveDate")}
        set{setValue(newValue, forKey: "leaveDate")}
    }
    
    var createdDate:Int64
    {
        get{ return int64ForKey(key: "createdDate")}
        set{setValue(newValue, forKey: "createdDate")}
    }
    var isApprove:Bool
    {
        get{ return boolForKey(key: "isApprove")}
        set{setValue(newValue, forKey: "isApprove")}
    }
    
}



class BankDetailModel: GenericDocDictionary,Codable {
    
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    var accountName:String
    {
        get{ return stringForKey(key: "accountName")}
        set{setValue(newValue, forKey: "accountName")}
    }
    
    var addressline1:String
    {
        get{ return stringForKey(key: "addressline1")}
        set{setValue(newValue, forKey: "addressline1")}
    }
    var addressline2:String
    {
        get{ return stringForKey(key: "addressline2")}
        set{setValue(newValue, forKey: "addressline2")}
    }
    var state:String
    {
        get{ return stringForKey(key: "state")}
        set{setValue(newValue, forKey: "state")}
    }
    var postcode:String
    {
        get{ return stringForKey(key: "postcode")}
        set{setValue(newValue, forKey: "postcode")}
    }
    var city:String
    {
        get{ return stringForKey(key: "city")}
        set{setValue(newValue, forKey: "city")}
    }
    var ibanNumber:String
    {
        get{ return stringForKey(key: "ibanNumber")}
        set{setValue(newValue, forKey: "ibanNumber")}
    }
    
    var routingNumber:String
    {
        get{ return stringForKey(key: "routingNumber")}
        set{setValue(newValue, forKey: "routingNumber")}
    }
    
    var accountNumber:String
    {
        get{ return stringForKey(key: "accountNumber")}
        set{setValue(newValue, forKey: "accountNumber")}
    }
    
}


class reportUserModel: GenericDocDictionary,Codable {
    
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    
    var reportedId:String
    {
        get{ return stringForKey(key: "reportedId")}
        set{setValue(newValue, forKey: "reportedId")}
    }
    
    var messageNotes:String
    {
        get{ return stringForKey(key: "messageNotes")}
        set{setValue(newValue, forKey: "messageNotes")}
    }
    
    var createdDate:Int64
    {
        get{ return int64ForKey(key: "createdDate")}
        set{setValue(newValue, forKey: "createdDate")}
    }
    
}


class jobWorkerAprovalModel: GenericDocDictionary,Codable {
    
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    
    var jobId:String
    {
        get{ return stringForKey(key: "jobId")}
        set{setValue(newValue, forKey: "jobId")}
    }
    
    var jobWorkId:String
    {
        get{ return stringForKey(key: "jobWorkId")}
        set{setValue(newValue, forKey: "jobWorkId")}
    }
    
    var startTime:Int64
    {
        get{ return int64ForKey(key: "startTime")}
        set{setValue(newValue, forKey: "startTime")}
    }
    
    var endTime:Int64
    {
        get{ return int64ForKey(key: "endTime")}
        set{setValue(newValue, forKey: "endTime")}
    }
    
}


class jobWorkerModel: GenericDocDictionary,Codable {
    
    
    var jobModel:JobsModel!
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    
    var notes:String
    {
        get{ return stringForKey(key: "notes")}
        set{setValue(newValue, forKey: "notes")}
    }
    
    
    var isActive:Bool
    {
        get{ return boolForKey(key: "isActive")}
        set{setValue(newValue, forKey: "isActive")}
    }
    
    var startTime:Int64
    {
        get{ return int64ForKey(key: "startTime")}
        set{setValue(newValue, forKey: "startTime")}
    }
    
    var endTime:Int64
    {
        get{ return int64ForKey(key: "endTime")}
        set{setValue(newValue, forKey: "endTime")}
    }
    
    var currentTimeReading:String
    {
        get{ return stringForKey(key: "currentTimeReading")}
        set{setValue(newValue, forKey: "currentTimeReading")}
    }
    
    var isBreakStarted:Bool
    {
        get{ return boolForKey(key: "isBreakStarted")}
        set{setValue(newValue, forKey: "isBreakStarted")}
    }
    
    var breakStartTime:Int64
    {
        get{ return int64ForKey(key: "BreakStartTime")}
        set{setValue(newValue, forKey: "BreakStartTime")}
    }
}


class JobsModel: GenericDocDictionary,Codable {
    
    var jobName:String
    {
        get{ return stringForKey(key: "jobName")}
        set{setValue(newValue, forKey: "jobName")}
    }
    
    var jobHours:Int64
    {
        get{ return int64ForKey(key: "jobHours")}
        set{setValue(newValue, forKey: "jobHours")}
    }
    var jobMin:Int64
    {
        get{ return int64ForKey(key: "jobMin")}
        set{setValue(newValue, forKey: "jobMin")}
    }
    
    var jobBreakTime:Int64
    {
        get{ return int64ForKey(key: "jobBreakTime")}
        set{setValue(newValue, forKey: "jobBreakTime")}
    }
    
    var jobDate:Int64
    {
        get{ return int64ForKey(key: "jobDate")}
        set{setValue(newValue, forKey: "jobDate")}
    }
    var isActive:Bool
    {
        get{ return boolForKey(key: "isActive")}
        set{setValue(newValue, forKey: "isActive")}
    }
    var jobLocation:String
    {
        get{ return stringForKey(key: "jobLocation")}
        set{setValue(newValue, forKey: "jobLocation")}
    }
    
    var jobLatitude:Double
    {
        get{ return doubleForKey(key: "jobLatitude")}
        set{setValue(newValue, forKey: "jobLatitude")}
    }
    
    var jobLongitute:Double
    {
        get{ return doubleForKey(key: "jobLongitute")}
        set{setValue(newValue, forKey: "jobLongitute")}
    }
    
}




class feedbackModel: GenericDocDictionary,Codable {
    
    var userEmail:String
    {
        get{ return stringForKey(key: "userEmail")}
        set{setValue(newValue, forKey: "userEmail")}
    }
    var subject:String
    {
        get{ return stringForKey(key: "subject")}
        set{setValue(newValue, forKey: "subject")}
    }
    
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    
    var details:String
    {
        get{ return stringForKey(key: "details")}
        set{setValue(newValue, forKey: "details")}
    }
    
}

class OrderModel: GenericDocDictionary,Codable {
    
    var proAmount:Int64
    {
        get{ return int64ForKey(key: "proAmount")}
        set{setValue(newValue, forKey: "proAmount")}
    }
    var proImage:String
    {
        get{ return stringForKey(key: "proImage")}
        set{setValue(newValue, forKey: "proImage")}
    }
    var proName:String
    {
        get{ return stringForKey(key: "proName")}
        set{setValue(newValue, forKey: "proName")}
    }
    
    var proCurrency:String
    {
        get{ return stringForKey(key: "proCurrency")}
        set{setValue(newValue, forKey: "proCurrency")}
    }
    var proStatus:String
    {
        get{ return stringForKey(key: "proStatus")}
        set{setValue(newValue, forKey: "proStatus")}
    }
    
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    
}

class CartModel: GenericDocDictionary,Codable {
    
    var proQuanity:Int64
    {
        get{ return int64ForKey(key: "proQuanity")}
        set{setValue(newValue, forKey: "proQuanity")}
    }
    var proId:String
    {
        get{ return stringForKey(key: "proId")}
        set{setValue(newValue, forKey: "proId")}
    }
    
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    
}

class OfferModel: GenericDocDictionary,Codable {
    
    var proAmount:Int64
    {
        get{ return int64ForKey(key: "proAmount")}
        set{setValue(newValue, forKey: "proAmount")}
    }
    var proId:String
    {
        get{ return stringForKey(key: "proId")}
        set{setValue(newValue, forKey: "proId")}
    }
    var proCurrency:String
    {
        get{ return stringForKey(key: "proCurrency")}
        set{setValue(newValue, forKey: "proCurrency")}
    }
    var exchangeAmount:Double
    {
        get{ return doubleForKey(key: "exchangeAmount")}
        set{setValue(newValue, forKey: "exchangeAmount")}
    }
    var exchangeCurrency:String
    {
        get{ return stringForKey(key: "exchangeCurrency")}
        set{setValue(newValue, forKey: "exchangeCurrency")}
    }
    
    var proName:String
    {
        get{ return stringForKey(key: "proName")}
        set{setValue(newValue, forKey: "proName")}
    }
    
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    var imageUrl:String
    {
        get{ return stringForKey(key: "imageUrl")}
        set{setValue(newValue, forKey: "imageUrl")}
    }
    var senderID:String
    {
        get{ return stringForKey(key: "senderID")}
        set{setValue(newValue, forKey: "senderID")}
    }
    var senderName:String
    {
        get{ return stringForKey(key: "senderName")}
        set{setValue(newValue, forKey: "senderName")}
    }
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    var ConversationID:String
    {
        get{ return stringForKey(key: "ConversationID")}
        set{setValue(newValue, forKey: "ConversationID")}
    }
    
}


class BankListModel: GenericDocDictionary,Codable {
    
    var bankName:String
    {
        get{ return stringForKey(key: "name")}
        set{setValue(newValue, forKey: "name")}
    }
    
}
class BankAccountListModel: GenericDocDictionary,Codable {
    
    var Bankid:String
    {
        get{ return stringForKey(key: "Bankid")}
        set{setValue(newValue, forKey: "Bankid")}
    }
    var AccountName:String
    {
        get{ return stringForKey(key: "accountName")}
        set{setValue(newValue, forKey: "accountName")}
    }
    var AccountNumber:String
    {
        get{ return stringForKey(key: "accountNumber")}
        set{setValue(newValue, forKey: "accountNumber")}
    }
}

class Walletmodel: GenericDocDictionary,Codable {
    
    var proAmount:Int64
    {
        get{ return int64ForKey(key: "proAmount")}
        set{setValue(newValue, forKey: "proAmount")}
    }
    var proId:String
    {
        get{ return stringForKey(key: "proId")}
        set{setValue(newValue, forKey: "proId")}
    }
    var proCurrency:String
    {
        get{ return stringForKey(key: "proCurrency")}
        set{setValue(newValue, forKey: "proCurrency")}
    }
    var proName:String
    {
        get{ return stringForKey(key: "proName")}
        set{setValue(newValue, forKey: "proName")}
    }
    
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    var imageUrl:String
    {
        get{ return stringForKey(key: "imageUrl")}
        set{setValue(newValue, forKey: "imageUrl")}
    }
    
    var clientSecret:String
    {
        get{ return stringForKey(key: "clientSecret")}
        set{setValue(newValue, forKey: "clientSecret")}
    }
    
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    
}

class TransactionHistory: GenericDocDictionary,Codable {
    
    
    
    var transId:String
    {
        get{ return stringForKey(key: "transId")}
        set{setValue(newValue, forKey: "transId")}
    }
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    
    var currency:String
    {
        get{ return stringForKey(key: "currency")}
        set{setValue(newValue, forKey: "currency")}
    }
    var Amount:String
    {
        get{ return stringForKey(key: "Amount")}
        set{setValue(newValue, forKey: "Amount")}
    }
    
    var transType:String
    {
        get{ return stringForKey(key: "transType")}
        set{setValue(newValue, forKey: "transType")}
    }
    var Status:String
    {
        get{ return stringForKey(key: "Status")}
        set{setValue(newValue, forKey: "Status")}
    }
    
    var bankObject:String
    {
        get{ return stringForKey(key: "bankObject")}
        set{setValue(newValue, forKey: "bankObject")}
    }
    
    var bankIban:String
    {
        get{ return stringForKey(key: "bankIban")}
        set{setValue(newValue, forKey: "bankIban")}
    }
    var ScreenShotIamge:String
    {
        get{ return stringForKey(key: "ScreenShotIamge")}
        set{setValue(newValue, forKey: "ScreenShotIamge")}
    }
    var clientSecrect:String
    {
        get{ return stringForKey(key: "clientSecrect")}
        set{setValue(newValue, forKey: "clientSecrect")}
    }
    
    var accountName:String
    {
        get{ return stringForKey(key: "accountName")}
        set{setValue(newValue, forKey: "accountName")}
    }
    
    
}


class TranferModel: GenericDocDictionary,Codable {
    
    
    var proId:String
    {
        get{ return stringForKey(key: "proId")}
        set{setValue(newValue, forKey: "proId")}
    }
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    
    var transferCurrency:String
    {
        get{ return stringForKey(key: "transferCurrency")}
        set{setValue(newValue, forKey: "transferCurrency")}
    }
    var transferStatus:String
    {
        get{ return stringForKey(key: "transferStatus")}
        set{setValue(newValue, forKey: "transferStatus")}
    }
    
    var tranferAmount:String
    {
        get{ return stringForKey(key: "tranferAmount")}
        set{setValue(newValue, forKey: "tranferAmount")}
    }
    
    var userID:String
    {
        get{ return stringForKey(key: "userID")}
        set{setValue(newValue, forKey: "userID")}
    }
    var accountName:String
    {
        get{ return stringForKey(key: "accountName")}
        set{setValue(newValue, forKey: "accountName")}
    }
    
    var bankName:String
    {
        get{ return stringForKey(key: "bankName")}
        set{setValue(newValue, forKey: "bankName")}
    }
    
    var ibanNumber:String
    {
        get{ return stringForKey(key: "ibanNumber")}
        set{setValue(newValue, forKey: "ibanNumber")}
    }
    
    
}





class ProductModel: GenericDocDictionary,Codable {
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    
    var proTitle:String
    {
        get{ return stringForKey(key: "proTitle")}
        set{setValue(newValue, forKey: "proTitle")}
    }
    var proCurrency:String
    {
        get{ return stringForKey(key: "proCurrency")}
        set{setValue(newValue, forKey: "proCurrency")}
    }
    
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    var proDescription:String
    {
        get{ return stringForKey(key: "proDescription")}
        set{setValue(newValue, forKey: "proDescription")}
    }
    
    var proexchangeCurr:String
    {
        get{ return stringForKey(key: "proexchangeCurr")}
        set{setValue(newValue, forKey: "proexchangeCurr")}
    }
    var proExchnagePrice:Int64
    {
        get{ return int64ForKey(key: "proExchnagePrice")}
        set{setValue(newValue, forKey: "proExchnagePrice")}
    }
    
    var proQuantity:Int64
    
    {
        get{ return int64ForKey(key: "proQuantity")}
        set{setValue(newValue, forKey: "proQuantity")}
    }
    var proImageUrl:String
    
    {
        get{ return stringForKey(key: "proImageUrls")}
        set{setValue(newValue, forKey: "proImageUrls")}
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    var proImageUrls:[String]
    
    {
        get{ return arrayStringForKey(key: "proImageUrls")}
        set{setValue(newValue, forKey: "proImageUrls")}
    }
    
    
    
    var proPhoneNumber:String
    
    {
        get{ return stringForKey(key: "proPhoneNumber")}
        set{setValue(newValue, forKey: "proPhoneNumber")}
    }
    
    
    var proWhatsAppNumber:String
    
    {
        get{ return stringForKey(key: "proWhatsAppNumber")}
        set{setValue(newValue, forKey: "proWhatsAppNumber")}
    }
    
    var ProCategory:String
    
    {
        get{ return stringForKey(key: "proCategory")}
        set{setValue(newValue, forKey: "proCategory")}
    }
    var priceby:String
    
    {
        get{ return stringForKey(key: "priceby")}
        set{setValue(newValue, forKey: "priceby")}
    }
    
    var currencyCode:String
    
    {
        get{ return stringForKey(key: "currencyCode")}
        set{setValue(newValue, forKey: "currencyCode")}
    }
    
    var ProLocation:String
    
    {
        get{ return stringForKey(key: "proLocation")}
        set{setValue(newValue, forKey: "proLocation")}
    }
    var ProCountry:String
    
    {
        get{ return stringForKey(key: "proCountry")}
        set{setValue(newValue, forKey: "proCountry")}
    }
    var ProCity:String
    
    {
        get{ return stringForKey(key: "proCity")}
        set{setValue(newValue, forKey: "proCity")}
    }
    
    var ProLatitute:Double
    
    {
        get{ return doubleForKey(key: "proLatitute")}
        set{setValue(newValue, forKey: "proLatitute")}
    }
    var ProLongitute:Double
    
    {
        get{ return doubleForKey(key: "proLongitute")}
        set{setValue(newValue, forKey: "proLongitute")}
    }
    var isApproved:Bool
    
    {
        get{ return boolForKey(key: "approve")}
        set{setValue(newValue, forKey: "approve")}
    }
    
}


class doctorProceduresModel: GenericDocDictionary,Codable {
    
    
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    var doctorName:String
    {
        get{ return stringForKey(key: "doctorName")}
        set{setValue(newValue, forKey: "doctorName")}
    }
    
    var procedureName:String
    {
        get{ return stringForKey(key: "procedureName")}
        set{setValue(newValue, forKey: "procedureName")}
    }
    
    
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    
    var procedureImageUrl:String
    
    {
        get{ return stringForKey(key: "procedureImageUrl")}
        set{setValue(newValue, forKey: "procedureImageUrl")}
    }
    
    
    var bookingDate:String
    
    {
        get{ return stringForKey(key: "bookingDate")}
        set{setValue(newValue, forKey: "bookingDate")}
    }
    
    
    var procedureCity:String
    
    {
        get{ return stringForKey(key: "procedureCity")}
        set{setValue(newValue, forKey: "procedureCity")}
    }
    
    var researchTitle:String
    
    {
        get{ return stringForKey(key: "researchTitle")}
        set{setValue(newValue, forKey: "researchTitle")}
    }
    
    
    var researchDescription:String
    
    {
        get{ return stringForKey(key: "researchDescription")}
        set{setValue(newValue, forKey: "researchDescription")}
    }
    
    
}
class albumModel: GenericDocDictionary,Codable {
    
    
    
    var userId:String
    {
        get{ return stringForKey(key: "userId")}
        set{setValue(newValue, forKey: "userId")}
    }
    var albumName:String
    {
        get{ return stringForKey(key: "albumName")}
        set{setValue(newValue, forKey: "albumName")}
    }
    
    var timeStamp:Int64
    {
        get{ return int64ForKey(key: "timeStamp")}
        set{setValue(newValue, forKey: "timeStamp")}
    }
    var imageUrl:String
    {
        get{ return stringForKey(key: "imageUrl")}
        set{setValue(newValue, forKey: "imageUrl")}
    }
    var imagesCount:Int
    {
        get{ return intForKey(key: "imagesCount")}
        set{setValue(newValue, forKey: "imagesCount")}
    }
    var images:[[String:Any]]
    
    {
        get{ return dictArrayForKey(key: "images")}
        set{setValue(newValue, forKey: "images")}
    }
    
}

class CategoryModel: GenericDocDictionary,Codable {
    
    
    var imageUrl:String
    {
        get{ return stringForKey(key: "imageUrl")}
        set{setValue(newValue, forKey: "imageUrl")}
    }
    
    var name:String
    {
        get{ return stringForKey(key: "name")}
        set{setValue(newValue, forKey: "name")}
    }
    
}

class FilesModel: GenericDocDictionary,Codable {
    
    
    var hasAccessToShare:Bool
    {
        get{ return boolForKey(key: "hasAccessToShare")}
        set{setValue(newValue, forKey: "hasAccessToShare")}
    }
    
    var name:String
    {
        get{ return stringForKey(key: "name")}
        set{setValue(newValue, forKey: "name")}
    }
    
    var url:String
    {
        get{ return stringForKey(key: "url")}
        set{setValue(newValue, forKey: "url")}
    }
    
    
}

