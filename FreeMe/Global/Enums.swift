//
//  Enums.swift
//  yahlove
//
//  Created by Buzzware Tech on 22/11/2022.
//

import UIKit

class Enums {

    
}
enum UserRole:String{
    case user,admin
}
enum Gender:String{
    case male,female
}
enum InviteStatus:String{
    case requested,accepted,rejected
}
enum ChatType:String{
    case one,many
}
enum favType:String{
    case likes,matches,visit
}
enum MessageType:String{
    case text,image,voice
}
enum profileType:String{
    case edit,visit,news
}
enum UserCategory:String,CaseIterable{
    case basic = "BASIC",advance = "ADVANCED",premium = "PREMIUM"
}
enum MediaType:String{
    case image = "public.image",video = "public.movie"
}
enum Weekdays:String,CaseIterable{
    case Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
}
enum FinanceType:String,CaseIterable{
    case repair,fuel,insurance
}
