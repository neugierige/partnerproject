//
//  SendMoneyController.swift
//  PHProjectTest
//
//  Created by Luyuan Xing on 7/14/16.
//  Copyright © 2016 Luyuan Xing. All rights reserved.
//

import UIKit
//import SevenSwitch

class SendMoneyController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    let logo = UIImageView()
    let amountLabel = UILabel()
    let amountInput = UITextField()
//    let currencySwitch = UISwitch()
//    let fancySwitch = SevenSwitch()
    let usdButton = UIButton()
    let eurButton = UIButton()
    let sendButton = UIButton()
    let themeColor = UIColor(red: 45/255, green: 151/255, blue: 193/255, alpha: 1)
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {
        let viewArray = [logo, amountLabel, amountInput, usdButton, eurButton, sendButton]
        for item in viewArray {
            self.view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        self.logo.image = UIImage(named: "PeopleHedge_logo")
        self.logo.contentMode = UIViewContentMode.ScaleToFill
        //TODO: find a smarter way to set that constant
        self.view.addConstraint(NSLayoutConstraint(item: logo, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: .Top, multiplier: 1.0, constant: 40))
        self.view.addConstraint(NSLayoutConstraint(item: logo, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        
        
        self.amountLabel.text = "Amount"
        self.amountLabel.textColor = themeColor
        self.amountLabel.textAlignment = .Left
        self.view.addConstraint(NSLayoutConstraint(item: amountLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: amountLabel, attribute: .Top, relatedBy: .Equal, toItem: self.logo, attribute: .Bottom, multiplier: 1.0, constant: 50))
        self.view.addConstraint(NSLayoutConstraint(item: amountLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: amountLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40))
        
        
        self.amountInput.layer.borderColor = themeColor.CGColor
        self.amountInput.layer.borderWidth = 5.0
        self.amountInput.textAlignment = .Right
        self.amountInput.clearsOnBeginEditing = true
        self.amountInput.delegate = self
        self.view.addConstraint(NSLayoutConstraint(item: amountInput, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: amountInput, attribute: .Top, relatedBy: .Equal, toItem: self.amountLabel, attribute: .Bottom, multiplier: 1.0, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: amountInput, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: amountInput, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40))
        
        
        //self.view.addSubview(currencySwitch)
        //        currencySwitch.translatesAutoresizingMaskIntoConstraints = false
        //        self.view.addConstraint(NSLayoutConstraint(item: currencySwitch, attribute: .CenterX, relatedBy: .Equal, toItem: self.amountInput, attribute: .CenterX, multiplier: 1.0, constant: 20))
        //        self.view.addConstraint(NSLayoutConstraint(item: currencySwitch, attribute: .Width, relatedBy: .Equal, toItem: self.amountInput, attribute: .Width, multiplier: 1.0, constant: 0))
        //        self.view.addConstraint(NSLayoutConstraint(item: currencySwitch, attribute: .Top, relatedBy: .Equal, toItem: self.amountInput, attribute: .Bottom, multiplier: 1.0, constant: 40))
        
        
        self.usdButton.setTitle("USD", forState: [])
        self.usdButton.layer.backgroundColor = themeColor.CGColor
        self.usdButton.setTitleColor(UIColor.whiteColor(), forState: [])
        self.view.addConstraint(NSLayoutConstraint(item: usdButton, attribute: .Left, relatedBy: .Equal, toItem: self.amountInput, attribute: .Left, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: usdButton, attribute: .Width, relatedBy: .Equal, toItem: self.amountInput, attribute: .Width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: usdButton, attribute: .Top, relatedBy: .Equal, toItem: self.amountInput, attribute: .Bottom, multiplier: 1.0, constant: 40))
        
        
        
        self.eurButton.setTitle("EUR", forState: [])
        self.eurButton.setTitleColor(themeColor, forState: [])
        self.eurButton.layer.borderWidth = 5.0
        self.eurButton.layer.borderColor = themeColor.CGColor
        self.view.addConstraint(NSLayoutConstraint(item: eurButton, attribute: .Right, relatedBy: .Equal, toItem: self.amountInput, attribute: .Right, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: eurButton, attribute: .Width, relatedBy: .Equal, toItem: self.amountInput, attribute: .Width, multiplier: 0.5, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: eurButton, attribute: .Top, relatedBy: .Equal, toItem: self.amountInput, attribute: .Bottom, multiplier: 1.0, constant: 40))
        
        
        self.sendButton.setTitle("Get a Quote", forState: [])
        self.sendButton.layer.backgroundColor = themeColor.CGColor
        self.view.addConstraint(NSLayoutConstraint(item: sendButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: sendButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 0.85, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: sendButton, attribute: .Width, relatedBy: .Equal, toItem: self.amountInput, attribute: .Width, multiplier: 0.75, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: sendButton, attribute: .Height, relatedBy: .Equal, toItem: self.sendButton, attribute: .Width, multiplier: 1, constant: 0))
        sendButton.clipsToBounds = true
        sendButton.layer.cornerRadius = sendButton.bounds.size.width/2
    }
    
    override func viewDidLoad() {
        
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
}
