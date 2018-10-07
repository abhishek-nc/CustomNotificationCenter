//
//  DetailController.swift
//  Panguesture
//
//  Created by Pavan Gopal on 10/8/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        CustomNotificationCenter.shared.addObserver(name: NSNotification.Name.foo, object: self, block: #selector(self.observer(_:)))
        
        CustomNotificationCenter.shared.postNotification(name: NSNotification.Name.foo)
        
    }
    
    @objc func observer(_ sender:NSNotification){
        print(#function)
    }

}
