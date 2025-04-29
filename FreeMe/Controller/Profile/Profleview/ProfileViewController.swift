//
//  ProfileViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

struct SectionData {
    let title: String
    let options: [SettingOption]
}

enum SettingOption: String {
    case personalInformation = "Personal Information"
    case lawFirmInformation = "Law Firm Information"
    
    case notifications = "Notifications"
    case language = "Language"
    
    case support = "Support"
    case loginAndSecurity = "Login & Security"
    
    
    case paymentsAndEarnings = "Payments & Earnings"
    
    
    case deleteAccount = "Delete Account"
    case privacyPolicy = "Privacy Policy"
    case termsOfService = "Terms of Service"
    case AttorneyContact = "Attorney Contact"
    case EmergencyContact = "Emergency Contact"
    case AddLawFirm = "Add Law Firm"
    case Membership = "Membership"
    
}

import UIKit

class ProfileViewController: UIViewController {
    
    let sections: [SectionData] = [
        SectionData(title: "Legal", options: [
            .privacyPolicy
        ]),
        SectionData(title: "Settings", options: [
            .personalInformation,
            .AttorneyContact,
            .EmergencyContact,
            .notifications,
            .language,
            .support,
            .loginAndSecurity,
            .AddLawFirm,
            .Membership
        ]),
        SectionData(title: "Legal", options: [
            .privacyPolicy,
            .termsOfService
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnlogout(_ sender: Any) {
        
        let vc = UIStoryboard.storyBoard(withName: .main).loadViewControllerss(withIdentifier: "ViewMain")
        UIApplication.shared.windows.first?.rootViewController = vc
        
    }
    
    @objc func switchAction(_ sender:UIButton){
        
        self.MoreServiceBtnPressed(sender)
        
    }
    
    
}
extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            
            return UIView()
        }
        else{
            let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self)?.first as! HeaderView
            
            headerView.lblname.text = self.sections[section].title
            
            return headerView
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.0
        }
        else{
            return 25.0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections[section].options.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTopTableViewCell", for: indexPath) as! ProfileTopTableViewCell
            cell.btnswitch.addTarget(self, action: #selector(switchAction), for: .touchUpInside)
            
            let view = UIView()
            view.backgroundColor = .clear
            cell.selectedBackgroundView = view
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCellTableViewCell", for: indexPath) as! ProfileCellTableViewCell
            
            let view = UIView()
            view.backgroundColor = .clear
            cell.selectedBackgroundView = view
            
            cell.llbname.text = self.sections[indexPath.section].options[indexPath.row].rawValue
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section != 0{
            
            
            let option = sections[indexPath.section].options[indexPath.row]
            
            switch option {
            case .personalInformation:
                print("Navigate to Personal Information")
                
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "PersonalInfoViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .AttorneyContact:
                print("Navigate to Law Firm Information")
                
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "AttorneyViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .notifications:
                print("Navigate to Notifications")
                
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "NotificationsViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .language:
                print("Navigate to Language")
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LangViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            case .AddLawFirm:
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "AddFirmViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            case .support:
                print("Navigate to Support")
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "ContactSupportViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            case .paymentsAndEarnings:
                
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "PaymentViewViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .loginAndSecurity:
                print("Navigate to Login & Security")
                
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "LoginSecViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            case .EmergencyContact:
                print("Navigate to Payments & Earnings")
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "EmergenctContactViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .Membership:
                let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "SubscrptionViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .deleteAccount:
                print("Navigate to Delete Account")
            case .privacyPolicy:
                print("Navigate to Privacy Policy")
            case .termsOfService:
                print("Navigate to Terms of Service")
            default:
                break
            }
     
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
