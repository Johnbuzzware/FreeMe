//
//  MessagesModel.swift
//  MyReferral
//
//  Created by vision on 09/06/20.
//  Copyright © 2020 vision. All rights reserved.
//

//import UIKit
//import MessageKit
//
//struct MessagesModel: MessageType {
//
//
//    var sender: SenderType {
//        return user
//    }
//
//    var messageId: String
//
//    var sentDate: Date
//
//    var kind: MessageKind
//
//    var user: SenderUser
//
//    private init(kind: MessageKind, user: SenderUser, messageId: String, date: Date) {
//        self.kind = kind
//        self.user = user
//        self.messageId = messageId
//        self.sentDate = date
//    }
//
//    init(text: String, user: SenderUser, messageId: String, timeStamp: Int64?) {
//        self.init(kind: .text(text), user: user, messageId: messageId, date: Date(timeIntervalSince1970: Double((timeStamp ?? Int64(Date().timeIntervalSince1970 * 1000)) / 1000)))
//    }
//
//
//}
//
//struct SenderUser: SenderType {
//    var senderId: String
//
//    var displayName: String
//}
