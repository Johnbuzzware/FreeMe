//
//  LocationModel.swift
//  DF1
//
//  Created by Buzzware Tech on 04/03/2021.
//

import UIKit

class LocationModel:Codable {

    var address_name:String!
    var address:String!
    var street_address_1:String!
    var street_address_2:String!
    var zipcode:String!
    var city:String!
    var state:String!
    var country_id:Int64!
    var address_lat:Double!
    var address_lng:Double!
    init(address_name:String? = nil,address:String? = nil,street_address_1:String? = nil,street_address_2:String? = nil,zipcode:String? = nil,city:String? = nil,state:String? = nil,country_id:Int64? = nil,address_lat:Double? = nil,address_lng:Double? = nil) {
        self.address_name = address_name
        self.address = address
        self.street_address_1 = street_address_1
        self.street_address_2 = street_address_2
        self.zipcode = zipcode
        self.city = city
        self.state = state
        self.country_id = country_id
        self.address_lat = address_lat
        self.address_lng = address_lng
    }
    init?(dic:NSDictionary) {
        
        
        let address_name = (dic as AnyObject).value(forKey: Constant.address_name) as? String
        let address = (dic as AnyObject).value(forKey: Constant.address) as? String
        let address_lat = (dic as AnyObject).value(forKey: Constant.address_lat) as? Double
        let address_lng = (dic as AnyObject).value(forKey: Constant.address_lng) as? Double
        
        
        
        self.address_name = address_name
        self.address = address
        self.address_lat = address_lat
        self.address_lng = address_lng
        
    }
    
}


//enum LocationKeys:String {
//    case addressName = "addressName"
//    case address = "address"
//    case streetAddress1 = "streetAddress1"
//    case streetAddress2 = "streetAddress2"
//    case zipcode = "zipcode"
//    case city = "city"
//    case state = "state"
//    case country = "country"
//    case addressLat = "addressLat"
//    case addressLng = "addressLng"
//
//}
//class LocationModels:GenericDictionary,Codable {
//
//
//    var addressName:String!
//    {
//        get{ return stringForKey(key: LocationKeys.addressName.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.addressName.rawValue)}
//    }
//    var address:String!
//    {
//        get{ return stringForKey(key: LocationKeys.address.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.address.rawValue)}
//    }
//    var streetAddress1:String!
//    {
//        get{ return stringForKey(key: LocationKeys.streetAddress1.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.streetAddress1.rawValue)}
//    }
//    var streetAddress2:String!
//    {
//        get{ return stringForKey(key: LocationKeys.streetAddress2.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.streetAddress2.rawValue)}
//    }
//    var zipcode:String!
//    {
//        get{ return stringForKey(key: LocationKeys.zipcode.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.zipcode.rawValue)}
//    }
//    var city:String!
//    {
//        get{ return stringForKey(key: LocationKeys.city.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.city.rawValue)}
//    }
//    var state:String!
//    {
//        get{ return stringForKey(key: LocationKeys.state.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.state.rawValue)}
//    }
//    var country:String!
//    {
//        get{ return stringForKey(key: LocationKeys.country.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.country.rawValue)}
//    }
//    var addressLat:Double!
//    {
//        get{ return douleForKey(key: LocationKeys.addressLat.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.addressLat.rawValue)}
//    }
//    var addressLng:Double!
//    {
//        get{ return douleForKey(key: LocationKeys.addressLng.rawValue)}
//        set{setValue(newValue, forKey: LocationKeys.addressLng.rawValue)}
//    }
//
//}
