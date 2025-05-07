//
//  FirebaseData.swift
//  MyReferral
//
//  Created by vision on 14/05/20.
//  Copyright © 2020 vision. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

class FirebaseData{
    
    
    class func splitGoogleName(name: String) -> (firstName: String, lastName: String) {
        // Splitting the name by space
        let nameComponents = name.components(separatedBy: " ")
        
        // Assuming the first part is the first name and the rest are part of the last name
        let firstName = nameComponents.first ?? ""
        let lastName = nameComponents.dropFirst().joined(separator: " ")
        
        return (firstName, lastName)
    }
    class func loginAuthUserData(token: AuthCredential, completion:@escaping (_ result:AuthDataResult?,_ error:Error?) -> ()) {
        let db = Auth.auth()
        
        db.signIn(with: token,completion: completion)
        
    }
    
    
    //    class func signinFacebook(_ category:UserCategory = .basic,controller:UIViewController,completion:@escaping (_ error:Error?) -> ()){
    //        if Utility.sharedInstance.isInternetAvailable(){
    //            let loginManager = LoginManager()
    //            if AccessToken.isCurrentAccessTokenActive{
    //                loginManager.logOut()
    //            }
    //
    //            loginManager.logIn(permissions: ["public_profile", "email"/*,"birthday","hometown","profile_pic"*/], from: controller) { (loginResult, error) in
    //                if let erro = error{
    //                    print(erro)
    //                    completion(erro)
    //                }
    //                else{
    //                    self.getFBUserData(category,completion: completion)
    //                }
    //            }
    //        }
    //        else{
    //            completion(NSError(domain: "No Data", code: 113, userInfo: [NSLocalizedDescriptionKey : NSLocalizedString("You are not connected to the internet. Please check your connection", comment: "")]))
    //        }
    //    }
    //    class func getFBUserData(_ category:UserCategory = .basic,completion:@escaping (_ error:Error?) -> ()){
    //
    //
    //        if AccessToken.current != nil{
    //            let credential = FacebookAuthProvider
    //                .credential(withAccessToken: AccessToken.current!.tokenString)
    //            self.loginAuthUserData(token: credential){result,error in
    //                if let error = error{
    //                    completion(error)
    //                }
    //                else{
    //                    guard let user = result else {return}
    //                    GraphRequest(graphPath: "me",parameters: ["fields": "id,email,name,first_name,last_name,friends, birthday, cover, devices,picture.type(large)"]).start{connection,result,error in
    //                        if (error == nil){
    //
    //                            let dict = result as! [String : AnyObject]
    //                            print(result!)
    //                            var dataDic = UserModel()
    //                            let UUIDEVETN = UUID().uuidString
    //
    //                            if let u_id = dict["id"] as? String{
    //
    //
    //                                dataDic.authtoken = u_id
    //
    //                            }
    //                            if let u_fname = dict["name"] as? String{
    //
    //                                var gFullname = u_fname
    //                                if gFullname.isEmpty{
    //
    //                                    dataDic.Name = "New User"
    //
    //                                }
    //                                else{
    //
    //                                    dataDic.Name = gFullname
    //
    //                                }
    //                            }
    //                            else{
    //                                dataDic.Name = "New User"
    //
    //                            }
    //                            if let u_email = dict["email"] as? String{
    //
    //                                dataDic.email = u_email
    //
    //                            }
    //                            if let pic_dic = dict["picture"] as? [String:Any]{
    //                                if let data = pic_dic["data"] as? [String:Any]{
    //                                    if let url = data["url"] as? String{
    //                                        dataDic.imageUrl = url
    //
    //                                    }
    //                                }
    //
    //                            }
    //
    //                            dataDic.userToken = Messaging.messaging().fcmToken
    //                            dataDic.userType = "User"
    //
    //
    //                            //dataDic.category = UserCategory.TattooArtist.rawValue
    //                            self.getUserData(uid: user.user.uid) { error, userData in
    //                                if error != nil{
    //                                    self.saveUserData(uid: user.user.uid, userData: dataDic) { error in
    //                                        completion(error)
    //                                    }
    //
    //                                }
    //                                else{
    //                                    completion(error)
    //
    //                                }
    //                            }
    //
    //                        }
    //                        else{
    //
    //                            completion(error)
    //                        }
    //                    }
    //
    //
    //                }
    //            }
    //
    //        }
    //        else{
    //            completion(NSError(domain: "No Data", code: 113, userInfo: [NSLocalizedDescriptionKey : NSLocalizedString("user cancelled", comment: "")]))
    //        }
    //    }
    
    class func verifyOTPAndLinkToEmail(verificationID: String, verificationCode: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        Auth.auth().currentUser?.link(with: credential) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success(true))
        }
    }
    
    class func verifyOTP(verificationID: String, verificationCode: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success(true))
        }
    }
    
    class func sendOTP(to phoneNumber: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        Auth.auth().languageCode = "US";
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                
                completion(.failure(error))
                return
            }
            
            guard let verificationID = verificationID else {
                let error = NSError(domain: "FirebaseAuthManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to get verification ID"])
                completion(.failure(error))
                return
            }
            
            completion(.success(verificationID))
        }
    }
    
    class func deleteAccount(uid:String,completion:@escaping (_ error:Error?) -> ()){
        
        var mAuth = Auth.auth()
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).document(uid).delete { error in
            if let error = error{
                completion(error)
                
            }
            else{
                mAuth.currentUser?.delete(completion: { error in
                    if let error = error{
                        completion(error)
                    }
                    else{
                        completion(nil)
                        
                    }
                })
            }
        }
    }
    class func logoutUserData(_ completion:@escaping (_ error:Error?) -> ()) {
        let db = Auth.auth()
        do {
            try db.signOut()
            completion(nil)
        }
        catch let error{
            completion(error)
        }
    }
    
    class func ResetPassword(email:String,completion:@escaping (_ error:Error?) -> ()){
        var mAuth = Auth.auth()
        mAuth.sendPasswordReset(withEmail: email) { Error in
            if let errorr = Error{
                completion(errorr)
                
            }
            else{
                completion(nil)
                
            }
        }
        
    }
    
    class func saveOrderDataa(orderData: OrderModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_ORDER).document().setData(orderData.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    class func savenotiModel(model: NotificationModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_NOTI).document().setData(model.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    
    class func saveCartData(cartModel: CartModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_CART).document(FirebaseData.getCurrentUserId()).setData(cartModel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    class func saveUserOffer(offerModel: OfferModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_OFFERS).document().setData(offerModel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    class func saveUserWallet(walletmodel: Walletmodel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_WALLET).document().setData(walletmodel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    class func saveTranferRequest(tranferModel: TranferModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_TRANSFER).document().setData(tranferModel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    
    class func saveProductData(proModel: ProductModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).document().setData(proModel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
        
        
    }
    
    class func deleteWallet(uid: String, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_WALLET).document(uid).delete { error in
            if let err = error {
                completion(err)
            } else {
                
                completion(nil)
            }
        }
    }
    
    
    class func deleteShift(jobID: String,wirkid:String, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobID).collection(Constant.NODE_JOBSWORKER).document(wirkid).delete { error in
            if let err = error {
                completion(err)
            } else {
                
                completion(nil)
            }
        }
    }
    
    class func deleteCart(uid: String, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_CART).document(uid).delete { error in
            if let err = error {
                completion(err)
            } else {
                
                completion(nil)
            }
        }
    }
    class func deleteNoti(uid: String, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_NOTI).document(uid).delete { error in
            if let err = error {
                completion(err)
            } else {
                
                completion(nil)
            }
        }
    }
    class func deleteOffer(uid: String, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_OFFERS).document(uid).delete { error in
            if let err = error {
                completion(err)
            } else {
                
                completion(nil)
            }
        }
    }
    
    class func deletePost(uid: String, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_POSTS).document(uid).delete { error in
            if let err = error {
                completion(err)
            } else {
                
                completion(nil)
            }
        }
    }
    
    
    
    class func saveBankDetails(uid:String,dataDic: BankDetailModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_BANKDETAIL).document(uid).setData(dataDic.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
    }
    class func getBankDetails(uid: String, completion:@escaping (_ error:Error?, _ userData: BankDetailModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_BANKDETAIL).document(uid).getDocument { (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                completion(nil, BankDetailModel(snap: snap!))
            }
        }
        
    }
    
    class func UpdateBankDetails(uid: String, dataDic: BankDetailModel , completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_BANKDETAIL).document(uid).updateData(dataDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    
    
    class func saveJobs(feedmodel: JobsModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document().setData(feedmodel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    class func savePostModel(postkodel: PostModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_POSTS).document().setData(postkodel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    class func saveUserworkJob(jobId:String,workId:String,jobworkModel: jobWorkerModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobId).collection(Constant.NODE_JOBSWORKER).document(workId).setData(jobworkModel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    
    class func saveLeaveData(leaveModell: leaveModel, completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_LEAVES).document().setData(leaveModell.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
        
        
    }
    
    
    class func saveJobEditAprovalData(aprovemodel: jobWorkerAprovalModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBAPPROVE).document().setData(aprovemodel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
        
        
    }
    
    class func saveTimeSheet(model: TimeSheetModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_TIMESHEET).document().setData(model.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
        
        
    }
    
    class func savefeedData(feedmodel: feedbackModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_FEED).document().setData(feedmodel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
        
        
    }
    
    class func SaveTransactionModel(transmodel: TransactionHistory, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_TRANSACTION).document().setData(transmodel.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
        
        
    }
    class func updateNotiValues(uid: String, cartDic: NotificationModel , completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_NOTI).document(uid).updateData(cartDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    class func updateCartValues(uid: String, cartDic: CartModel , completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_CART).document(uid).updateData(cartDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    
    class func updateWalletValues(uid: String, walletDic: Walletmodel , completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_WALLET).document(uid).updateData(walletDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    
    class func updateProdcutValues(uid: String, proDic: ProductModel , completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_PRODUCTS).document(uid).updateData(proDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    
    class func loginWithEmail(email:String,password:String,completion:@escaping (_ error:Error?) -> ()){
        
        var mAuth = Auth.auth()
        mAuth.signIn(withEmail: email, password: password) { user, error in
            
            if let error = error,user == nil{
                print("SignInFailed")
                //self.handleError(error)
                completion(error)
                
            }
            else{
                
                completion(nil)
                
            }
        }
    }
    
    class func RegisterWithEmailPassword(email:String,password:String,completion:@escaping (_ error:Error?) -> ()){
        
        let mAuth = Auth.auth()
        mAuth.createUser(withEmail: email, password: password) { result, err in
            if let err = err{
                completion(err)
            }
            else{
                completion(nil)
            }
        }
    }
    
    class func RegistrationWithPhoneNumber(langCode:String,PhoneNumber:String,completion:@escaping (_ error:Error?,_ verificationID:String?) -> ()){
        
        Auth.auth().languageCode = langCode
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(PhoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    completion(error,nil)
                    
                }
                
                else{
                    completion(nil,verificationID)
                }
            }
    }
    
    class func VerifyPhoneWithCode(verificationID:String,Code:String,completion:@escaping (_ error:Error?) -> ()){
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID,verificationCode: Code )
        Auth.auth().signIn(with: credential) { authData, error in
            if let error = error {
                // Handles error
                completion(error)
            }
            
            else{
                completion(nil)
                
            }
        }
        
    }
    
    
    
    class func saveUserData(uid: String, userData: UserModel, completion:@escaping (_ error:Error?) -> ()) {
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).document(uid).setData(userData.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    class func saveReported( reportedData: reportUserModel, completion:@escaping (_ error:Error?) -> ()) {
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_REPORT).document().setData(reportedData.dictionary, completion: {
            err in
            
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    
    class func enableAllNotifications(for uid: String, completion: @escaping (Error?) -> ()) {
        let db = Firestore.firestore()
        let settings: [String: Bool] = [
            "sound": true,
            "vibration": true,
            "inAppNotifications": true,
            "messages": true,
            "friendRequests": true
        ]
        
        db.collection(Constant.NODE_NOTISET).document(uid).setData(settings, merge: true) { error in
            completion(error)
        }
    }
    
    class func saveUserDataDic(uid: String,userData: Any, completion:@escaping (_ error:Error?) -> ()) {
        let db = Firestore.firestore()
        let dic: [String:Any]!
        if let user = userData as? UserModel{
            dic = user.dictionary
        }
        else{
            dic = userData as? [String:Any]
        }
        db.collection(Constant.NODE_USERS).document(uid).setData(dic, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    class func DeleteCart(c_id:String,completion:@escaping (_ error:Error?) -> ()){
        let db = Firestore.firestore()
        
        
        db.collection(Constant.NODE_CART).document(c_id).delete { err in
            if let err = err {
                
                completion(err)
            } else {
                completion(nil)
            }
        }
        
        
        
        
    }
    
    
    class func DeleteProduct(P_ID:String,completion:@escaping (_ error:Error?) -> ()){
        let db = Firestore.firestore()
        
        
        db.collection(Constant.NODE_PRODUCTS).document(P_ID).delete { err in
            if let err = err {
                
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
    
    class func getUserData(uid: String, completion:@escaping (_ error:Error?, _ userData: UserModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).document(uid).getDocument { (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                completion(nil, UserModel(snap: snap!))
            }
        }
    }
    
    
    
    class func getUserDatarealTime(uid: String, completion:@escaping (_ error:Error?, _ userData: UserModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).document(uid).addSnapshotListener{ (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                completion(nil, UserModel(snap: snap!))
            }
        }
        
    }
    
    
    
    class func getProductData(uid: String, completion:@escaping (_ error:Error?, _ userData: ProductModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).document(uid).getDocument { (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                completion(nil, ProductModel(snap: snap!))
            }
        }
        
    }
    
    class func getJobWorkModel(jobId:String,workId:String,completion:@escaping (_ error:Error?, _ userData: jobWorkerModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobId).collection(Constant.NODE_JOBSWORKER).document(workId).getDocument { (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                
                completion(nil, jobWorkerModel(snap: snap!))
            }
        }
    }
    
    class func getJobWorkModelRealTime(jobID: String,workID: String, completion:@escaping (_ error:Error?, _ userData: jobWorkerModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobID).collection(Constant.NODE_JOBSWORKER).document(workID).addSnapshotListener{ (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                completion(nil, jobWorkerModel(snap: snap!))
            }
        }
        
    }
    
    class func updateJobWorkValues(jobID: String,workID:String, proDic: jobWorkerModel , completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobID).collection(Constant.NODE_JOBSWORKER).document(workID).updateData(proDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    
    
    
    class func addMessageToConversation(documentId: String, chatModel:ChatModel,isSendAdmin:Bool = false,completion:@escaping (_ error:Error?) -> ()) {
        let db = Firestore.firestore()
        var node = Constant.NODE_CHAT
        
        db.collection(node).document(documentId).collection(Constant.NODE_CONVERSATIONS).document(chatModel.messageId).setData(chatModel.dictionary, completion: { error in
            if let err = error {
                completion(err)
            } else {
                completion(nil)
            }
        })
    }
    
    class func getConverstationOfTwoUsersSerivce(_ uid:String,conversationId:String,node:String = Constant.NODE_CHAT, completion:@escaping (_ user:UserModel?, _ error:Error?) -> ()){
        let db = Firestore.firestore()
        db.collection(node).document(conversationId).getDocument { (querySnapshot, error) in
            if let err = error {
                completion(nil,err)
            }else {
                let chat = ParticepentsModel(snap: querySnapshot!)
                chat?.participants.removeValue(forKey: uid)
                if let recivrid = chat?.participants.keys.first{
                    self.getUserData(uid: recivrid) { error, userData in
                        if let err = error {
                            completion(nil,err)
                        }else {
                            completion(userData,nil)
                        }
                    }
                }
                else{
                    completion(nil,nil)
                }
            }
        }
    }
    
    class func getConverstationIdOfTwoUsers(senderId:String, receiverId:String, completion:@escaping (_ conversationId:String?, _ error:Error?) -> ()){
        let db = Firestore.firestore()
        db.collection(Constant.NODE_CHAT).whereField("participants.\(senderId)", isEqualTo: true).whereField("participants.\(receiverId)", isEqualTo: true).getDocuments { (querySnapshot, error) in
            if let err = error {
                completion(nil,err)
            }else {
                if querySnapshot?.documents.count ?? 0 > 0 {
                    for queryDocument in querySnapshot?.documents ?? [] {
                        completion(queryDocument.documentID, nil)
                        return
                    }
                }
                completion(nil,nil)
            }
        }
    }
    
    
    
    class func getJobModel(jobId:String,completion:@escaping (_ error:Error?, _ userData: JobsModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobId).getDocument { (snap, error) in
            if let err = error {
                completion(err,nil)
            }else {
                
                completion(nil, JobsModel(snap: snap!))
            }
        }
    }
    
    class func updateUserChildValues(uid: String, userDic: UserModel , completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).document(uid).updateData(userDic.dictionary) { error in
            
            if let err = error {
                completion(err)
            }else {
                completion(nil)
            }
        }
        
    }
    
    class func setnotification(mainUID:String,userDic: NotificationModel, completion:@escaping (_ error:Error?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_NOTI).document().setData(userDic.dictionary, completion: {
            err in
            if let err = err {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    class func getPostOfAll(completion:@escaping (_ error:Error?, _ referrals:[PostModel]?) -> ()){
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_POSTS).getDocuments { (querySnapShot, error) in
            getPostData(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    
    class func getPostData(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals: [PostModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            var referralList:[PostModel] = []
            
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = PostModel(snap: queryDocument )!
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
            }
            
        }
    }
    
    
    
    
    class func checkUserEmailData(email:String,completion:@escaping (_ error:Error?, _ referrals:[UserModel]?) -> ()){
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).whereField("email", isEqualTo: email).getDocuments { (querySnapShot, error) in
            getUserData(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    class func checkUserPhoneData(Phone:String,completion:@escaping (_ error:Error?, _ referrals:[UserModel]?) -> ()){
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).whereField("userPhone", isEqualTo: Phone).getDocuments { (querySnapShot, error) in
            getUserData(querySnapShot: querySnapShot, error: error, completion: completion)
        }
    }
    
    
    class func checkUserEmail(email:String,completion:@escaping (_ error:Error?, _ referrals:Bool?) -> ()){
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).whereField("email", isEqualTo: email).getDocuments { (querySnapShot, error) in
            
            getUserDataBool(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
    }
    class func checkUserPhone(Phone:String,completion:@escaping (_ error:Error?, _ referrals:Bool?) -> ()){
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).whereField("userPhone", isEqualTo: Phone).getDocuments { (querySnapShot, error) in
            getUserDataBool(querySnapShot: querySnapShot, error: error, completion: completion)
        }
    }
    
    
    
    
    class func fetchUserProducts(uid:String,completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).whereField("userId", isEqualTo: uid).getDocuments { (querySnapShot, error) in
            getProducts(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
        
    }
    
    class func fetchUserOffers(uid:String,completion:@escaping (_ error:Error?, _ referrals:[OfferModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_OFFERS).whereField("userID", isEqualTo: uid).getDocuments { (querySnapShot, error) in
            getOffers(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
        
    }
    
    
    class func getUserData(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals: [UserModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            var referralList:[UserModel] = []
            
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = UserModel(snap: queryDocument )!
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
            }
            
        }
    }
    
    
    
    class func getUserDataBool(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals: Bool?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            if querySnapShot?.documents.count ?? 0 > 0 {
                
                completion(nil,true)
                
            }
            else{
                completion(nil,false)
            }
            
        }
    }
    
    class func getWallet(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[Walletmodel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[Walletmodel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = Walletmodel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    class func getBanksDetails(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[BankAccountListModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[BankAccountListModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = BankAccountListModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    class func getBanks(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[BankListModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[BankListModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = BankListModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getProducts(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[ProductModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = ProductModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getOffers(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[OfferModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[OfferModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = OfferModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    
    
    class func UploadImageArray(docImage:[UIImage], completion:@escaping (_ error:Error?, _ url: [URL]?) -> ()) {
        
        
        var urls = [URL]()
        
        let id = FirebaseData.getCurrentUserId()
        let dispatach = DispatchGroup()
        
        for i in docImage{
            dispatach.enter()
            
            let imageName = UUID().uuidString
            let storageRef = Storage.storage().reference().child("\(id)/albumImages/png").child(imageName)
            if let uploadData = i.jpegData(compressionQuality: 0.5){
                let metaDataForImage = StorageMetadata()
                metaDataForImage.contentType = "image/jpeg"
                storageRef.putData(uploadData, metadata: metaDataForImage
                                   , completion: { (metadata, error) in
                    if error != nil {
                        
                        completion(error,nil)
                        
                    }
                    else
                    {
                        storageRef.downloadURL(completion: { (url, error) in
                            if error != nil {
                                completion(error,nil)
                            }
                            else{
                                print(url!)
                                urls.append(url!)
                                dispatach.leave()
                            }
                            
                        })
                        
                    }
                })
            }
            
        }
        dispatach.notify(queue: .main) {
            
            completion(nil,urls)
        }
        
        
        
    }
    
    
    
    class func UploadImagess(uid: String,imageID: String,docPath:String,docImage:UIImage, completion:@escaping (_ error:Error?, _ url: URL?) -> ()) {
        
        
        let storageRef = Storage.storage().reference().child("\(uid)/\(docPath)/png").child(imageID)
        
        if let uploadData = docImage.jpegData(compressionQuality: 0.5){
            let metaDataForImage = StorageMetadata()
            metaDataForImage.contentType = "image/jpeg"
            storageRef.putData(uploadData, metadata: metaDataForImage
                               , completion: { (metadata, error) in
                if error != nil {
                    
                    completion(error,nil)
                    
                }
                
                else
                {
                    storageRef.downloadURL(completion: { (url, error) in
                        if error != nil {
                            completion(error,nil)
                        }
                        else{
                            
                            completion(error,url)
                            
                        }
                        
                    })
                    
                }
            })
        }
    }
    
    class func UploadImagesDoc(uid: String,docPath:String,docImage:UIImage, completion:@escaping (_ error:Error?, _ url: URL?) -> ()) {
        
        
        //let imagecompress = docImage.compress(to: .low)
        let storageRef = Storage.storage().reference().child("/\(docPath)/png").child(uid)
        if let uploadData = docImage.jpegData(compressionQuality: 0.3){
            let metaDataForImage = StorageMetadata()
            metaDataForImage.contentType = "image/jpeg"
            storageRef.putData(uploadData, metadata: metaDataForImage
                               , completion: { (metadata, error) in
                if error != nil {
                    completion(error,nil)
                }
                else
                {
                    storageRef.downloadURL(completion: { (url, error) in
                        if error != nil {
                            completion(error,nil)
                        }
                        else{
                            completion(error,url)
                        }
                    })
                }
            })
        }
        
        
        
    }
    
    class func uploadDocs(uid: String,imageNmae: String,docPath:String,exteension:String,docURL:URL, completion:@escaping (_ error:Error?, _ url: URL?) -> ()) {
        
        
        let storageRef = Storage.storage().reference().child("\(uid)/\(docPath)/\(exteension)").child(imageNmae)
        
        let metaDataForImage = StorageMetadata()
        metaDataForImage.contentType = exteension
        
        
        storageRef.putFile(from: docURL, metadata: metaDataForImage, completion:{ url, error in
            if error != nil {
                
                completion(error,nil)
                
            }
            
            else
            {
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        completion(error,nil)
                    }
                    else{
                        
                        completion(error,url)
                        
                    }
                    
                })
                
            }
        })
        
    }
    
    
    
    class func fetchAllLeaves(userId:String,isapprove:Bool,completion:@escaping (_ error:Error?, _ referrals:[leaveModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_LEAVES).whereField("userId", isEqualTo: userId).whereField("isApprove", isEqualTo: isapprove).getDocuments { (querySnapShot, error) in
            getLeaves(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
    }
    
    
    
    class func fetchAllJobs(completion:@escaping (_ error:Error?, _ referrals:[JobsModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).getDocuments { (querySnapShot, error) in
            getJobs(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
    }
    
    class func fetchJobWorkers(jobId:String,completion:@escaping (_ error:Error?, _ referrals:[jobWorkerModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobId).collection(Constant.NODE_JOBSWORKER).getDocuments { (querySnapShot, error) in
            getJobWorkers(querySnapShot: querySnapShot, error: error, completion: completion)
        }
    }
    
    class func fetchJobWorkersCurrent(jobId:String,userid:String,completion:@escaping (_ error:Error?, _ referralsModel:jobWorkerModel?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_JOBS).document(jobId).collection(Constant.NODE_JOBSWORKER).whereField("userId", isEqualTo: userid).whereField("isActive", isEqualTo: true).getDocuments { (querySnapShot, error) in
            if let err = error {
                completion(err,nil)
                
            }else {
                
                if querySnapShot?.documents.count ?? 0 > 0 {
                    let firstDoc = querySnapShot?.documents.first!
                    let dic = jobWorkerModel(snap: firstDoc!)!
                    completion(nil,dic)
                    
                }
                else{
                    completion(nil,nil)
                }
                
            }
        }
    }
    
    class func fetchUserTimeSheer(userid:String,completion:@escaping (_ error:Error?, _ referralsModel:[TimeSheetModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_TIMESHEET).whereField("userId", isEqualTo: userid).getDocuments { (querySnapShot, error) in
            if let err = error {
                completion(err,nil)
                
            }else {
                
                var referralList:[TimeSheetModel] = []
                if querySnapShot?.documents.count ?? 0 > 0 {
                    querySnapShot?.documents.forEach({ (queryDocument) in
                        let dic = TimeSheetModel(snap: queryDocument )!
                        
                        referralList.append(dic)
                    })
                    completion(nil,referralList)
                    
                }
                else{
                    completion(nil,nil)
                    
                }
                
                
            }
        }
    }
    
    
    
    
    class func fetchUsers(completion:@escaping (_ error:Error?, _ referrals:[UserModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_USERS).getDocuments { (querySnapShot, error) in
            getUsers(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
    }
    
    class func fetchCategories(completion:@escaping (_ error:Error?, _ referrals:[CategoryModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_CATEGORY).getDocuments { (querySnapShot, error) in
            getCategory(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
    }
    
    
    class func fetchProductsByCatgory(cat:String,completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).whereField("proCategory", isEqualTo: cat).getDocuments { (querySnapShot, error) in
            getProducts(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
    }
    
    class func fetchBanks(completion:@escaping (_ error:Error?, _ referrals:[BankListModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_BANKLIST).getDocuments { (querySnapShot, error) in
            getBanks(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    
    class func fetchBanksDetails(uid:String,completion:@escaping (_ error:Error?, _ referrals:[BankAccountListModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_BANKLISTACCOUNT).whereField("bankId", isEqualTo: uid).getDocuments { (querySnapShot, error) in
            
            getBanksDetails(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    
    class func fetchProductsOfUser(uid:String,completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).whereField("userId", isEqualTo: uid).getDocuments { (querySnapShot, error) in
            getProducts(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    
    class func fetchProductsAllProduts(completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).getDocuments { (querySnapShot, error) in
            getProducts(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    class func fetchProductsAllwithQuery(city:String,coutry:String,completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).whereField("proCity", isEqualTo: city).whereField("proCountry", isEqualTo: coutry).whereField("approve", isEqualTo: true).getDocuments { (querySnapShot, error) in
            getProducts(querySnapShot: querySnapShot, error: error, completion: completion)
        }
    }
    
    
    
    class func fetchNotificationsread(UID:String,completion:@escaping (_ error:Error?, _ referrals:[NotificationModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_NOTI).whereField("userId", isEqualTo: UID).whereField("isRead", isEqualTo: false).getDocuments { (querySnapShot, error) in
            getnotifcations(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
    }
    
    class func fetchNotificationss(UID:String,completion:@escaping (_ error:Error?, _ referrals:[NotificationModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_NOTI).whereField("userId", isEqualTo: UID).getDocuments { (querySnapShot, error) in
            getnotifcations(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
    }
    
    
    
    class func fetchUserCart(UID:String,completion:@escaping (_ error:Error?, _ referrals:[CartModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_CART).whereField("userID", isEqualTo: UID).getDocuments { (querySnapShot, error) in
            getcart(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
    }
    
    class func fetchUserOrders(UID:String,completion:@escaping (_ error:Error?, _ referrals:[OrderModel]?) -> ()) {
        
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_ORDER).whereField("userID", isEqualTo: UID).getDocuments { (querySnapShot, error) in
            getOrders(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
    }
    
    
    
    class func fetchAllProducts(completion:@escaping (_ error:Error?, _ referrals:[ProductModel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_PRODUCTS).getDocuments { (querySnapShot, error) in
            getProducts(querySnapShot: querySnapShot, error: error, completion: completion)
        }
        
        
        
    }
    class func fetchWallet(uid:String,completion:@escaping (_ error:Error?, _ referrals:[Walletmodel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_WALLET).whereField("userID", isEqualTo: uid).getDocuments { (querySnapShot, error) in
            getWallet(querySnapShot: querySnapShot, error: error, completion: completion)
        }
    }
    
    
    class func fetchWalletByCurrency(uid:String,currency:String,completion:@escaping (_ error:Error?, _ referrals:[Walletmodel]?) -> ()) {
        
        let db = Firestore.firestore()
        db.collection(Constant.NODE_WALLET).whereField("userID", isEqualTo: uid).whereField("proCurrency", isEqualTo: currency).getDocuments { (querySnapShot, error) in
            getWallet(querySnapShot: querySnapShot, error: error, completion: completion)
        }
    }
    
    
    
    class func getJobWorkers(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[jobWorkerModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
            
        }else {
            
            var referralList:[jobWorkerModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = jobWorkerModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getLeaves(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[leaveModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
            
        }else {
            
            var referralList:[leaveModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = leaveModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getJobs(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[JobsModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
            
        }else {
            
            var referralList:[JobsModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = JobsModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    class func getUsers(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[UserModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
            
        }else {
            
            var referralList:[UserModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = UserModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    class func getCategory(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[CategoryModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[CategoryModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = CategoryModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getnotifcations(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[NotificationModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[NotificationModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = NotificationModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getcart(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[CartModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[CartModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = CartModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    class func getOrders(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[OrderModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[OrderModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = OrderModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    
    class func getAlbums(querySnapShot:QuerySnapshot?, error:Error?,completion:@escaping (_ error:Error?, _ referrals:[albumModel]?) -> ()) {
        if let err = error {
            completion(err,nil)
        }else {
            
            var referralList:[albumModel] = []
            if querySnapShot?.documents.count ?? 0 > 0 {
                querySnapShot?.documents.forEach({ (queryDocument) in
                    let dic = albumModel(snap: queryDocument )!
                    
                    referralList.append(dic)
                })
                completion(nil,referralList)
                
            }
            else{
                completion(nil,nil)
                
            }
            
        }
    }
    
    
    class func getCurrentUserId() -> String {
        
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    class func CheckUserID() -> String? {
        
        
        
        return Auth.auth().currentUser?.uid
    }
    
    class func checkUserAgainstDatabase(completion: @escaping (_ success: Bool, _ error: NSError?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else { return }
        currentUser.getIDTokenForcingRefresh(true, completion:  { (idToken, error) in
            if let error = error {
                completion(false, error as NSError?)
                print(error.localizedDescription)
            } else {
                completion(true, nil)
            }
        })
    }
    
    
    class func addAdminMessageToConversation(documentId: String, chatModel:ChatModel,completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_CHAT).document(documentId).collection(Constant.NODE_CONVERSATIONS).document(chatModel.messageId).setData(chatModel.dictionary, completion: { error in
            if let err = error {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    
    
    class func addMessageToConversation(documentId: String, chatModel:ChatModel,completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_CHAT).document(documentId).collection(Constant.NODE_CONVERSATIONS).document(chatModel.messageId).setData(chatModel.dictionary, completion: { error in
            if let err = error {
                completion(err)
            } else {
                completion(nil)
            }
        })
        
    }
    class func updateMessageToConversation(documentId: String, chatModel:ChatModel,completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        
        db.collection(Constant.NODE_CHAT).document(documentId).collection(Constant.NODE_CONVERSATIONS).document(chatModel.messageId).updateData(chatModel.dictionary){ error in
            if let err = error {
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
    
    class func updateLastMessageContent(proID:String,documentId: String, chatModel:ChatModel,completion:@escaping (_ error:Error?) -> ()) {
        
        let db = Firestore.firestore()
        chatModel.productId = proID
        db.collection(Constant.NODE_CHAT).document(documentId).updateData([ "lastMessage":chatModel.dictionary]){ error in
            if let err = error {
                completion(err)
            } else {
                completion(nil)
            }
        }
    }
    
    class func uploadProfileImage(image:UIImage,name:String ,folder:String,index:Int = 0,completion: @escaping (_ url: String?,_ error: Error?,_ index:Int) -> Void) {
        let storageRef = Storage.storage().reference().child("\(folder)/\(name).png")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        if let uploadData = image.pngData() {
            storageRef.putData(uploadData, metadata: metadata) { (metadata, error) in
                if error != nil {
                    completion(nil, error,index)
                } else {
                    storageRef.downloadURL { (url, error) in
                        if error != nil {
                            completion(nil, error,index)
                        }else {
                            completion(url?.absoluteString ?? "", nil,index)
                        }
                    }
                }
            }
        }
    }
    
    
    
}
extension UIImage {
    /// Enum to define compression quality levels
    enum CompressionQuality {
        case low
        case medium
        case high
        
        var value: CGFloat {
            switch self {
            case .low:
                return 0.1
            case .medium:
                return 0.5
            case .high:
                return 0.9
            }
        }
    }
    
    /// Compresses the image to the specified compression quality.
    ///
    /// - Parameters:
    ///   - quality: The desired compression quality (`low`, `medium`, `high`).
    /// - Returns: A compressed UIImage.
    func compress(to quality: CompressionQuality) -> UIImage? {
        guard let compressedData = self.jpegData(compressionQuality: quality.value) else {
            return nil
        }
        return UIImage(data: compressedData)
    }
}
