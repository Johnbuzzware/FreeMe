//
//  AlertQueueViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 17/02/2025.
//

import UIKit

class AlertQueueViewController: UIViewController {

    @IBOutlet weak var btnon: UIButton!
    
    @IBOutlet weak var btnque: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.btnque.setTitleColor(.white, for: .normal)
        self.btnon.setTitleColor(.black, for: .normal)

        self.btnque.backgroundColor = UIColor().colorsFromAsset(name: .BlueColor001)
        self.btnon.backgroundColor = .clear

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func btnonclient(_ sender: Any) {
        
        self.btnon.setTitleColor(.white, for: .normal)
        self.btnque.setTitleColor(.black, for: .normal)

        self.btnon.backgroundColor = UIColor().colorsFromAsset(name: .BlueColor001)
        self.btnque.backgroundColor = .clear
        
        

        
    }
    @IBAction func btnclient(_ sender: Any) {
        
        self.btnque.setTitleColor(.white, for: .normal)
        self.btnon.setTitleColor(.black, for: .normal)

        self.btnque.backgroundColor = UIColor().colorsFromAsset(name: .BlueColor001)
        self.btnon.backgroundColor = .clear
        
        
    }
    

}
extension AlertQueueViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlertQueueTableViewCell", for: indexPath) as! AlertQueueTableViewCell
        
        let view = UIView()
        view.backgroundColor = .clear
        cell.selectedBackgroundView = view
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
        
        
    }
    
    
}
