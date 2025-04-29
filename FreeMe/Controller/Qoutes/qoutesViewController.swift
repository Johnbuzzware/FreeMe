//
//  qoutesViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class qoutesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
extension qoutesViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "qoutesTableViewCell", for: indexPath) as! qoutesTableViewCell
        
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "QoutesDetailsViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
}
