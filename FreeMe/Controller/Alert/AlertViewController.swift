//
//  AlertViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension AlertViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alertTableViewTableViewCell", for: indexPath) as! alertTableViewTableViewCell
            
            let view = UIView()
            view.backgroundColor = .clear
            cell.selectedBackgroundView = view
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "alertImagTableViewCell", for: indexPath) as! alertImagTableViewCell
            
            let view = UIView()
            view.backgroundColor = .clear
            cell.selectedBackgroundView = view
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "alertVoiceTableViewCell", for: indexPath) as! alertVoiceTableViewCell
            
            let view = UIView()
            view.backgroundColor = .clear
            cell.selectedBackgroundView = view
            
            return cell
        }
   
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
        
        
    }
    
    
}
