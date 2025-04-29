//
//  ContactSupportViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class ContactSupportViewController: UIViewController {


    @IBOutlet weak var ivmessageTableview: UITableView!
    
   // @IBOutlet weak var tfMesage: UITextView_Additions!
   // @IBOutlet weak var tfmessageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblname: UILabel!
    var optionArray = [options]()
    
   // @IBOutlet weak var ivimage: UIImageView!
    var ivView = UIView()
    let maxHeight: CGFloat = 100 // Maximum height for the text view

    var dataDic:[String:Any]!

    
//    var messageList: [ChatModel] = []
//    var conversationID: String!
//    var receiverUser: [UserModel]? = []
//    var curentUser: UserModel?// = CommonHelper.getCachedUserData()
//    var messageListModel: MessageListModel?
//    var isSendAdmin:Bool = false
//    var isChat:Bool = true
//    var node:String! = Constant.NODE_ADMINCHAT
//    var groupName = ""
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.ivTopView.drawCorner(roundTo: .bottom)
        //self.ivBottomView.drawCorner(roundTo: .top)
        
       // self.ivmessageTableview.isHidden = true
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true

        
//        tfMesage.textColor = UIColor.lightGray
//        self.tfMesage.text = "Your Message"
//        self.tfMesage.delegate = self
        
        
//        sideMenuController?.rightViewWidth = self.view.bounds.width - self.view.bounds.width/2.8
//        sideMenuController?.rootViewLayerShadowRadius = 10.0
//        sideMenuController?.rightViewSwipeGestureRange = .init(left: 0.0, right: 10.0)
//
//        sideMenuController?.rightViewPresentationStyle = .slideBelow
//        sideMenuController?.rightViewAnimationDuration = 1.0
//        sideMenuController?.rootViewCoverAlphaForLeftView = 0.9

        
        
//        ivmessageTableview.transform = CGAffineTransform(scaleX: 1, y: -1)
//        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
//        ivmessageTableview.contentInset = contentInset
//        ivmessageTableview.setContentOffset(CGPoint(x: 0, y: -ivmessageTableview.contentInset.bottom), animated: false)

        
        // Do any additional setup after loading the view.
    }
    
//    class func instantiateVC() -> MessagesViewController
//    {
//        let storyboard = UIStoryboard.storyBoard(withName: .Home)
//        let controller = storyboard.loadViewController(withIdentifier: .MessagesViewController) as! MessagesViewController
//        return controller
//    }
    
//    func loadNavigation(){
//        if self.isChat{
//            if let fname = receiverUser?.first?.firstName{
//                self.lblname.text = fname
//                self.ivimage.imageURLProfile(receiverUser?.first?.userImage ?? "")
//            }
//            else{
//                self.lblname.text = ""
//                self.ivimage.imageURLProfile("")
//
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
       // getCurentUser()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Set the content offset to the bottom
        
        self.ivmessageTableview.isHidden = false
        
        
        
       // ivmessageTableview.setContentOffset(CGPoint(x: 0, y: contentHeight - tableHeight), animated: false)
    }
    
//    func getMessagesList(){
//        PopupHelper.showAnimating(self)
//        let db = Firestore.firestore()
//        var chatsList:[ChatModel] = []
//        self.node = Constant.NODE_CHATS
//        if isSendAdmin{
//            self.node = Constant.NODE_ADMINCHAT
//        }
//        var chatType = ChatType.one.rawValue
//        if isChat{
//            chatType = ChatType.one.rawValue
//        }
//        else{
//            chatType = ChatType.many.rawValue
//        }
//        if conversationID != nil && !(conversationID?.isEmpty ?? true) {
//            db.collection(self.node).document(conversationID!).collection(Constant.NODE_CONVERSATIONS).order(by: "timestamp", descending: false).addSnapshotListener{
//                (querySnap, error) in
//
//                if querySnap?.documentChanges.count ?? 0 > 0 {
//                    if let dc = querySnap?.documentChanges.last{
//                        if dc.type == .added {
//
//
//                            var dics = [String:Any]()
//                            let documentID = dc.document.reference.parent.parent?.documentID ?? self.conversationID ?? ""
//                            if self.isChat{
//                                var participants:[String:Any] = [:]
//
//                                if let id = dc.document.data()["fromID"] as? String,!id.isEmpty{
//                                    participants[id] = true
//                                }
//                                if let id = dc.document.data()["toID"] as? String,!id.isEmpty{
//                                    participants[id] = true
//                                }
//
//                                dics["participants"] = participants
//                                dics["lastMessage"] = dc.document.data()
//                                dics[MessageListKeys.chatType.rawValue] = chatType
//                                db.collection(self.node).document(documentID).updateData(dics){
//                                    error in
//                                    if let error = error{
//                                        print(error.localizedDescription)
//                                        db.collection(self.node).document(documentID).setData(dics){
//                                            error in
//                                            print(error?.localizedDescription ?? "")
//                                        }
//                                    }
//
//                                }
//                            }
//                            else{
//                                var participants:[String:Any] = [:]
//                                participants[FirebaseData.getCurrentUserId()] = true
//                                for i in self.receiverUser!{
//                                    participants[i.docId] = true
//
//                                }
//                                dics["participants"] = participants
//                                dics["lastMessage"] = dc.document.data()
//                                dics[MessageListKeys.chatType.rawValue] = chatType
//                                dics[MessageListKeys.groupName.rawValue] = self.groupName
//                                db.collection(self.node).document(documentID).updateData(dics){
//                                    error in
//                                    if let error = error{
//                                        print(error.localizedDescription)
//                                        db.collection(self.node).document(documentID).setData(dics){
//                                            error in
//                                            print(error?.localizedDescription ?? "")
//                                        }
//                                    }
//
//                                }
//                            }
//
//                        }
//                        else if dc.type == .removed{
//                            if let dcc = querySnap?.documents.last{
//                                chatsList.removeAll { ChatModels in
//                                    return ChatModels.docId == dc.document.documentID
//                                }
//                                db.collection(self.node).document(dcc.reference.parent.parent?.documentID ?? "").updateData(["lastMessage":dcc.data()])
//                            }
//
//                        }
//                    }
//                    for query in querySnap?.documentChanges ?? [] {
//                        if query.type == .added{
//                            let chatModel = ChatModel(snap: query.document)
//                            chatsList.append(chatModel!)
//                        }
//                    }
//                    self.messageList = chatsList
////                    for chat in chatsList {
////                        self.messageList.append(MessagesModel(text: chat.content, user: SenderUser(senderId: chat.fromID, displayName: self.curentSender?.displayName ?? "", photoURL: self.curentUser?.image ?? ""), messageId: chat.messageId, timeStamp: chat.timestamp,kind: chat.type))
////                    }
//                    self.ivmessageTableview.reloadData()
//                    if self.messageList.count > 2{
//                        let index = IndexPath(row: self.messageList.count - 1, section: 0)
//                        self.ivmessageTableview.scrollToRow(at: index, at: .bottom, animated: true)
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                        self.stopAnimating()
//                    }
//                }
//                else{
//                    self.stopAnimating()
//                }
//            }
//        }
//    }
//
//
//    func getCurentUser(){
//        PopupHelper.showAnimating(self)
//        FirebaseData.getUserData(uid: FirebaseData.getCurrentUserId()) { error, userData in
//            if let error = error {
//                self.stopAnimating()
//            }
//            self.curentUser = userData
//            if self.receiverUser != nil{
//                self.getMessagesList()
//                self.loadNavigation()
//            }
//            else{
//                self.node = Constant.NODE_CHATS
//                if self.isSendAdmin{
//                    self.node = Constant.NODE_ADMINCHAT
//                }
//                if self.isChat{
//                    FirebaseData.getConverstationOfTwoUsersSerivce(FirebaseData.getCurrentUserId(), conversationId: self.conversationID,node:self.node) { user, error in
//                        guard let user = user else {
//                            return
//                        }
//                        self.receiverUser = [user]
//                        self.getMessagesList()
//                        self.loadNavigation()
//                    }
//                }
//                else{
//                    FirebaseData.getConverstationOfManyUsersSerivce(FirebaseData.getCurrentUserId(), conversationId: self.conversationID,node:self.node) { user, error in
//                        guard let user = user else {
//                            return
//                        }
//                        self.receiverUser = user
//                        self.getMessagesList()
//                        self.loadNavigation()
//                    }
//                }
//
//            }
//
//        }
//    }
    
    
    @IBAction func sendBtnPressed(_ sender:Any){
//        if let text = self.tfMesage.text{
//            if text.isEmpty{
//                PopupHelper.showAlertControllerWithError(forErrorMessage: "Insert text here", forViewController: self)
//            }
//            else{
//                self.insertMessages(text)
//            }
//
//        }
//        else{
//            PopupHelper.showAlertControllerWithError(forErrorMessage: "Insert text here", forViewController: self)
//        }
        
    }
    
//    func insertMessages(_ data: String) {
//        if !data.isEmpty || data != nil {
//
//
//            let user = self.curentUser!
//            let chatModel = ChatModel()
//            chatModel.content = data
//            chatModel.fromID = user.docId
//            chatModel.toID = self.receiverUser?.first?.docId ?? ""
//            chatModel.messageId = UUID().uuidString
//            chatModel.timestamp = Int64(Date().timeIntervalSince1970 * 1000)
//            chatModel.isRead = false
//            chatModel.type = "text"
//            PopupHelper.showAnimating(self)
//            FirebaseData.addMessageToConversation(documentId: self.conversationID ?? "", chatModel: chatModel,isSendAdmin: self.isSendAdmin, completion: { error in
//                if let error = error {
//                    PopupHelper.showAlertControllerWithError(forErrorMessage: error.localizedDescription, forViewController: self)
//                    return
//                }
//
//
//                var NotiModel = NotificationModel()
//
//                NotiModel.image = self.curentUser?.userImage ?? ""
//                NotiModel.isSent = "0"
//                NotiModel.message = "\(self.curentUser!.userName ?? ""): \(data)"
//                NotiModel.time = "\(Int64(Date().timeIntervalSince1970 * 1000))"
//                NotiModel.title = "New Message"
//                NotiModel.userID = self.receiverUser?.first?.docId ?? ""
//                NotiModel.conversationID = self.conversationID ?? ""
//                NotiModel.senderId = FirebaseData.getCurrentUserId()
//                if self.isChat{
//
//                    NotiModel.type = "Msg"
//                    NotiModel.groupname = ""
//                }
//                else{
//                    NotiModel.type = "groupMsg"
//                    NotiModel.groupname = self.groupName
//
//
//                }
//
//                FirebaseData.setnotification(mainUID: self.receiverUser?.first?.docId ?? "" , userDic: NotiModel) { error in
//                    if error != nil {
//                        self.stopAnimating()
//
//                    }
//                    else{
//                        self.stopAnimating()
//                        self.tfMesage.text = ""
//                        self.tfMesage.resignFirstResponder()
//                       // self.CallNotification(userID: self.receiverUser?.first?.docId ?? "", title: "New Message", messge: "\(self.curentUser!.userName ?? ""): \(data)")
//                    }
//                }
//
//            })
//        }
//        else{
//
//        }
//    }

    
    
}
extension ContactSupportViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
      //  return self.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row%2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightTextTableViewCell") as! rightTextTableViewCell
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "leftTextTableViewCell") as! leftTextTableViewCell
            return cell
        }
//        if self.messageList[indexPath.row].fromID == FirebaseData.getCurrentUserId(){
//            switch MessageType(rawValue: self.messageList[indexPath.row].type){
////            case .voice:
////                let cell = tableView.dequeueReusableCell(withIdentifier: "rightVoiceTableViewCell") as! rightTextTableViewCell
////
////                //cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
////                if let time = self.messageList[indexPath.row].timestamp {
////                    cell.lbltime.text = time.getInt64toTime().formattedWith(Globals.__HH_mm)
////                }
////                cell.btnPlay.tag = indexPath.row
////                cell.btnPlay.addTarget(self, action: #selector(self.playAudio(_:)), for: .touchUpInside)
////                return cell
//            case .image:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "rightImageTableViewCell") as! rightTextTableViewCell
//
//                //cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
//                if let time = self.messageList[indexPath.row].timestamp {
//                    cell.lbltime.text = time.getInt64toTime().formattedWith(Globals.__hh_mm_a)
//                }
//                cell.ivImage.imageURL(self.messageList[indexPath.row].content )
//
//                return cell
//            default:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "rightTextTableViewCell") as! rightTextTableViewCell
//
//                //cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
//
//                if let msg = self.messageList[indexPath.row].content {
//                    cell.lblmessage.text = msg
//                }
//                if let time = self.messageList[indexPath.row].timestamp {
//                    cell.lbltime.text = time.getInt64toTime().formattedWith(Globals.__hh_mm_a)
//                }
//                return cell
//            }
//
//        }
//        else{
//
//            switch MessageType(rawValue: self.messageList[indexPath.row].type ?? ""){
//            case.image:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "leftImageTableViewCell") as! leftTextTableViewCell
//
//                //cell.contentView.transform = CGAffineTransform(scaleX: 1, y: -1)
//                if let time = self.messageList[indexPath.row].timestamp {
//                    cell.lbltime.text = time.getInt64toTime().formattedWith(Globals.__HH_mm)
//                }
//                cell.ivImage.imageURL(self.messageList[indexPath.row].content ?? "")
//
//                return cell
//
//            default:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "leftTextTableViewCell") as! leftTextTableViewCell
//
//                if let msg = self.messageList[indexPath.row].content {
//                    cell.lblmessage.text = msg
//                }
//                if let time = self.messageList[indexPath.row].timestamp {
//                    cell.lbltime.text = time.getInt64toTime().formattedWith(Globals.__HH_mm)
//                }
//                return cell
//            }
//
//
//        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}


//extension MessagesViewController: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return animator
//    }
//
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return interactiveTransition
//    }
//}

extension ContactSupportViewController:UITextViewDelegate{
    
//    func textViewDidBeginEditing(_ textView: UITextView) {
//
//        if textView.textColor == UIColor.lightGray {
//            textView.text = nil
//            textView.textColor = UIColor.black
//        }
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = "Your Message"
//            textView.textColor = UIColor.lightGray
//        }
//    }
//    func textViewDidChange(_ textView: UITextView) {
//        updateTextViewHeight()
//    }
//
//    func updateTextViewHeight() {
//        // Calculate the size needed to fit the text content
//        let size = tfMesage.sizeThatFits(CGSize(width: tfMesage.frame.width, height: 40))
//
//        // Check if the calculated height exceeds the maximum height
//        if size.height > maxHeight {
//            // If the height exceeds the maximum, set the height constraint to the maximum height
//            tfmessageHeight.constant = maxHeight
//            tfMesage.isScrollEnabled = true // Enable scrolling to see the truncated text
//        } else {
//            // If the height is within the maximum, set the updated height constraint for the text view
//            tfmessageHeight.constant = size.height
//            tfMesage.isScrollEnabled = false // Disable scrolling as the content fits within the view
//        }
//
//        // Call layoutIfNeeded to animate the height change if needed
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
//    }
    
    
    
    func makeEditMenu() -> [UIAction] {
        var actionarr = [UIAction]()
        for (i,data) in self.optionArray.enumerated(){
            let action = UIAction(title: data.name,
                                  image: UIImage(named: data.image),
                                  identifier: UIAction.Identifier("\(i)" )) { act in //.hidden - to hide the action
                
              
                
                
                print("Edit Image Action\(act.accessibilityHint ?? "")")
                
            }
            action.accessibilityHint = "\(i)"
            actionarr.append(action)
        }
        
        return actionarr
    }
}


//extension MessagesViewController:UIViewControllerTransitioningDelegate{
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return customTransition
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return CustomDismissalAnimator()
//    }
//}
