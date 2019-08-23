//
//  APIWrapper.swift
//  SampleEngineerUI
//
//  Created by Venkateswara Reddy N on 23/08/19.
//  Copyright © 2019 ojas. All rights reserved.
//

import UIKit
import Alamofire

class APIWapper: SessionManager {
    
    var interNetRechability = Reachability()
    var actIndicator = UIActivityIndicatorView()
    var activityBGV = UIView()
    //var noNetAlert = UIAlertView()
    //var netConnectedAlert = UIAlertView()
    var imageview = UIImageView()
    var noNetAlert = UIAlertController()
    var netConnectedAlert = UIAlertController()
    
    static var sharedObject = APIWapper()
    
    class func shareHolder() -> APIWapper {
        sharedObject = APIWapper.init()
        return sharedObject
    }
    
    init() {
        super.init()
        
        activityBGV = UIView.init()
        activityBGV.frame = (UIApplication.shared.delegate?.window??.frame)! as CGRect
        activityBGV.backgroundColor = UIColor.clear
        imageview = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        
        imageview.image = UIImage.init(named: "abc.png")
        imageview.layer.cornerRadius = 10
        imageview.layer.masksToBounds = true
        imageview.backgroundColor = UIColor.gray
        actIndicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style(rawValue: 1)!)
        actIndicator.frame = (UIApplication.shared.delegate?.window??.frame)! as CGRect
        activityBGV.center = (UIApplication.shared.delegate?.window??.center)!
        actIndicator.center = activityBGV.center
        imageview.center = activityBGV.center
        activityBGV.addSubview(imageview)
        activityBGV.addSubview(actIndicator)
        UIApplication.shared.delegate?.window??.addSubview(activityBGV)
        actIndicator.isHidden = true
        
    }
   
    func  netConnected() {
        //    netConnectedAlert.dismiss(withClickedButtonIndex: 0, animated: true);
        //        netConnectedAlert = UIAlertView.init(title: "Alert", message: "netConnect", delegate: nil, cancelButtonTitle: "OK")
        //        netConnectedAlert.tag = 101
        //        netConnectedAlert.show();
        
        //        netConnectedAlert = UIAlertController.init(title: "Alert!", message: "netConnect", preferredStyle: .alert);
        //        let okAction : UIAlertAction = UIAlertAction.init(title: "OK", style:.cancel, handler: nil)
        //        netConnectedAlert.addAction(okAction);
        //UIApplication.shared.delegate?.window??.rootViewController?.present(netConnectedAlert, animated: true, completion: nil);
        //  ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "You are now connected to the Internet.")
        
    }
    func isNetConnected() -> Bool {
        
        if !Reachability.isConnectedToNetwork() {
            return false
            
        }
        
        return true
    }
    
    func netDisConnected() {
        self.stopActivityIndicator()
        
     //   ShowCustomAlert.sharedInstaic.showErrorAlrrt(messge: "You are not connected to the Internet.")
    }
    
    func startActivityIndictor() {
        activityBGV.isHidden = false
        // activityBGV.backgroundColor =  UIColor.blue;
        
        UIApplication.shared.delegate?.window??.bringSubviewToFront(activityBGV)
        actIndicator.startAnimating()
        
    }
    func stopActivityIndicator() {
        actIndicator.stopAnimating()
        activityBGV.isHidden = true
    }
 
   
}
