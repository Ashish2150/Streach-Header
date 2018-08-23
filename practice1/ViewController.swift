//
//  ViewController.swift
//  practice1
//
//  Created by Ashish Kumar Mourya on 14/05/18.
//  Copyright © 2018 Ashish Kumar Mourya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
   
    let imageView = UIImageView()
    
    //@IBOutlet weak var hightConstant: NSLayoutConstraint!
    
        var containerLayoutConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
      
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        tableView.backgroundColor = UIColor.darkGray
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "meal")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
    }

    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//            return .lightContent
//    }
//
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 214)
        let height = min(max(y, 0), 600)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        if height <= 84 {
            
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
                
          self.navigationController?.navigationBar.isTranslucent = false
                 self.view.layoutIfNeeded()
            }, completion: nil)

        } else{
                
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.8, options: .curveLinear, animations: {
            self.navigationController?.navigationBar.isTranslucent = true
                }, completion: nil)

        }
        
        
        
    }
    
    
}





