//
//  ViewController.swift
//  Panguesture
//
//  Created by Pavan Gopal on 10/7/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        CustomNotificationCenter.shared.addObserver(name: NSNotification.Name.foo, object: self, block: #selector(self.observer(_:)))
        
    }
    
    @objc func observer(_ sender:NSNotification){
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(2)
        presentDetail()
    }
    
    func presentDetail(){
        
        
        let detailControlelr = DetailController(nibName: nil, bundle: nil)
        
        self.present(detailControlelr, animated: true) {
            CustomNotificationCenter.shared.removeObserver(observer: self, name: Notification.Name.foo)
            CustomNotificationCenter.shared.postNotification(name: NSNotification.Name.foo)
        }
    }
}


