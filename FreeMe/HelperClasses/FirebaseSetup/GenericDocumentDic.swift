//
//  GenericDocumentDic.swift
//  Bet That
//
//  Created by Macbook Air on 6/19/21.
//


import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class GenericDocDictionary: NSObject {
    
    var dictionary:[String:Any] = [:]
    
    var snapshot:DocumentSnapshot!
    
    
    
    var docId:String
    {
        let key = self.snapshot.documentID
        return key
    }
    
    
    func boolForKey(key:String) -> Bool{
        
        return self.boolForKey(key: key, defaultValue: false)!
    }
    
    func boolForKey(key:String,defaultValue:Bool?)->Bool?
    {
        return (dictionary[key] as? Bool) ?? defaultValue
    }
    
    func int64ForKey(key:String)->Int64
    {
        return self.int64ForKey(key: key, defaultValue: -1)!
    }
    
    func int64ForKey(key:String,defaultValue:Int64)->Int64?
    {
        return (dictionary[key] as? Int64) ?? defaultValue
    }
    
    func intForKey(key:String)->Int
    {
        return self.intForKey(key: key, defaultValue: 1)!
    }
    
    func intForKey(key:String,defaultValue:Int?)->Int?
    {
        return (dictionary[key] as? Int) ?? defaultValue
    }
    
    func stringForKey(key:String)->String
    {
        return self.stringForKey(key: key, defaultValue: "")!
    }
    
    func stringForKey(key:String,defaultValue:String?)->String?
    {
        return (dictionary[key] as? String) ?? defaultValue
    }
    func typeForKey(key:String)->MessageType
    {
        return self.typeForKey(key: key, defaultValue: .text)!
    }
    
    func typeForKey(key:String,defaultValue:MessageType?)->MessageType?
    {
        return (MessageType(rawValue: dictionary[key] as? String ?? MessageType.text.rawValue)) ?? defaultValue
    }
    func doubleForKey(key:String)->Double
    {
        return self.doubleForKey(key: key, defaultValue: -1)!
    }
    
    func doubleForKey(key:String,defaultValue:Double?)->Double?
    {
        return (dictionary[key] as? Double) ?? defaultValue
    }
    
    func arrayStringForKey(key : String) ->[String]
    {
        return (self.arrayStringForKey(key: key, defaultValue: [])) ?? [String]()
    }
    
    func arrayStringForKey(key : String, defaultValue:[String]?) ->[String]?
    {
        return (dictionary[key] as? [String]) ?? defaultValue
    }

    
    func arrayForKey(key : String) ->[Any]
    {
        return (self.arrayForKey(key: key, defaultValue: []))!
    }
    
    func arrayForKey(key : String, defaultValue:[Any]?) ->[Any]?
    {
        return (dictionary[key] as? [Any]) ?? defaultValue
    }
    
//    func modelarrayForKey(key : String) ->[SubClaimDetailModel]
//    {
//        return (self.modelarrayForKey(key: key, defaultValue: []))!
//    }
//    func modelarrayForKey(key : String, defaultValue:[SubClaimDetailModel]?) ->[SubClaimDetailModel]?
//    {
//        return (dictionary[key] as? [SubClaimDetailModel]) ?? defaultValue
//    }
    
    
    func dictArrayForKey(key : String) ->[[String : Any]]
    {
        return self.dictArrayForKey(key: key, defaultValue: [[:]])!
                return (dictionary[key] as? [[String : Any]])!
    }
    
    
    
    func dictArrayForKey(key : String, defaultValue:[[String : Any]]?) ->[[String : Any]]?
    {
        return (dictionary[key] as? [[String : Any]]) ?? defaultValue
    }

    
    func stringDictForKey(key : String) ->[String : String]
    {
        return self.stringDictForKey(key: key, defaultValue: [:])!
                return (dictionary[key] as? [String : String])!
    }
    
    func stringDictForKey(key : String, defaultValue:[String : String]?) ->[String : String]?
    {
        return (dictionary[key] as? [String : String]) ?? defaultValue
    }
    
    
    func dictForKey(key : String) ->[String : Any]
    {
        return self.dictForKey(key: key, defaultValue: [:])!
                return (dictionary[key] as? [String : Any])!
    }
    
    func dictForKey(key : String, defaultValue:[String : Any]?) ->[String : Any]?
    {
        return (dictionary[key] as? [String : Any]) ?? defaultValue
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        dictionary[key] = value
    }
    
    required init?(snap:DocumentSnapshot) {
        super.init()
        self.snapshot = snap;
        self.dictionary = snap.data() ?? [:]
    }
    
    init?(dictionary:AnyObject) {
        super.init()
        //self.snapshot = QueryDocumentSnapshot();
        self.dictionary = dictionary as? [String:Any] ?? ["":""]
    }

    override init(){
        super.init()
       //self.snapshot = QueryDocumentSnapshot();
        self.dictionary = [:]
    }
    
    
    
    @nonobjc
    convenience init(otherDictionaryObject: GenericDocDictionary) {
        self.init(snap: otherDictionaryObject.snapshot)!
    }
    
    func copy(with zone: NSZone?) -> Any {
        return type(of: self).init(snap: snapshot)!
        
    }
    
    
    override var hash: Int {return (dictionary as NSObject).hash}
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? GenericDocDictionary else {return false}
        return self.isEqual(to: other)
    }
    
    func isEqual(to dictionaryModelObject: GenericDocDictionary) -> Bool {
        guard type(of: dictionaryModelObject) == type(of: self) else {return false}
        return (dictionary as NSObject).isEqual(dictionaryModelObject.dictionary as NSObject)
    }
}
