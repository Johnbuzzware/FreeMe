//
//  ChatModel.swift
//  MyReferral
//
//  Created by vision on 09/06/20.
//  Copyright © 2020 vision. All rights reserved.
//

import UIKit

class ChatModel: GenericDocDictionary {
    
    var content:String
    {
        get{ return stringForKey(key: "content")}
        set{setValue(newValue, forKey: "content")}
    }
    
    var fromID:String
    {
        get{ return stringForKey(key: "fromID")}
        set{setValue(newValue, forKey: "fromID")}
    }
    
    var toID:String
    {
        get{ return stringForKey(key: "toID")}
        set{setValue(newValue, forKey: "toID")}
    }
    
    var timestamp:Int64
    {
        get{ return int64ForKey(key: "timestamp")}
        set{setValue(newValue, forKey: "timestamp")}
    }
    
    var type:String
    {
        get{ return stringForKey(key: "type")}
        set{setValue(newValue, forKey: "type")}
    }
    
    var isRead:Bool?
    {
        get{ return boolForKey(key: "isRead", defaultValue: false)}
        set{setValue(newValue, forKey: "isRead")}
    }
    
    var messageId:String
    {
        get{ return stringForKey(key: "messageId")}
        set{setValue(newValue, forKey: "messageId")}
    }
    var productId:String
    {
        get{ return stringForKey(key: "productId")}
        set{setValue(newValue, forKey: "productId")}
    }
}


class NotificationModel: GenericDocDictionary {

    var isRead: Bool {
        get { return boolForKey(key: "isRead") }
        set { setValue(newValue, forKey: "isRead") }
    }
    
    var leaveId: String {
        get { return stringForKey(key: "leaveId") }
        set { setValue(newValue, forKey: "leaveId") }
    }
    var senderId: String {
        get { return stringForKey(key: "senderId") }
        set { setValue(newValue, forKey: "senderId") }
    }

    var message: String {
        get { return stringForKey(key: "message") }
        set { setValue(newValue, forKey: "message") }
    }

    var timestamp: Int64 {
        get { return int64ForKey(key: "timestamp") }
        set { setValue(newValue, forKey: "timestamp") }
    }

    var title: String {
        get { return stringForKey(key: "title") }
        set { setValue(newValue, forKey: "title") }
    }

    var type: String {
        get { return stringForKey(key: "type") }
        set { setValue(newValue, forKey: "type") }
    }

    var userId: String {
        get { return stringForKey(key: "userId") }
        set { setValue(newValue, forKey: "userId") }
    }
}

