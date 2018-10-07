//
//  CustomNotificationCenter.swift
//  CustomNotificationCenter
//
//  Created by Pavan Gopal on 10/8/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import Foundation

class CustomNotificationCenter {
    
    static var shared = CustomNotificationCenter()
    private init(){}
    
    private var observerList: [Notification.Name:[(observer:NSObject,selector:Selector)]] = [:]
    
    func addObserver(name:NSNotification.Name,object:NSObject,block:Selector){
        
        if let _ = observerList[name]{
            observerList[name]?.append((object,block))
        }else{
            observerList[name] = [(object,block)]
        }
    }
    
    func removeObserver(observer:NSObject,name:Notification.Name){
        observerList[name] = observerList[name]?.filter({$0.observer != observer})
    }
    
    func postNotification(name:NSNotification.Name,userInfo:[AnyHashable:Any]? = nil){
        guard let observerTuple = observerList[name] else{return}
        
        observerTuple.forEach { (observerDict) in
            let observer = observerDict.observer
            let notification = NSNotification(name: name, object: observer, userInfo: userInfo)
            observer.perform(observerDict.selector, with: notification)
        }
        
    }
    
}
