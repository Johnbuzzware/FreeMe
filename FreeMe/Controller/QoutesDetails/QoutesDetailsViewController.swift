//
//  QoutesDetailsViewController.swift
//  FreeMe
//
//  Created by Asad's Mac on 18/02/2025.
//

import UIKit

class QoutesDetailsViewController: UIViewController {
    
    @IBOutlet weak var ivcollectionVie: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnire(_ sender: Any) {
        
        
        let vc = UIStoryboard.storyBoard(withName: .Home).loadViewControllerss(withIdentifier: "popAtorneyViewController")
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
        
    }
    
    
    
}
extension QoutesDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QoutesDetailsCollectionViewCell", for: indexPath) as!  QoutesDetailsCollectionViewCell
        
        return cell
        
    }
}
