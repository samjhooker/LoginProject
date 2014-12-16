//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Samuel Hooker on 17/12/14.
//  Copyright (c) 2014 Jocus Interactive. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate { // we can call these functions both within the CreateAccountViewController and any other class
    func accountCreated ()
}

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate:CreateAccountViewControllerDelegate?
    
    let kUsernameKey = "usernameKey"
    let kPasswordKey = "passwordKey"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createAccountButtonPressed(sender: AnyObject) {
        
        if choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text != nil {
            
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUsernameKey)
            
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
            
            NSUserDefaults.standardUserDefaults().synchronize()
            
            //these are the small bits of info which are saved on the device when it is closed down, ie, settings
            //generally, you ould not use NSUserDefualts for password saving as it is insecure but I shall do for simpicity.
            
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
            delegate?.accountCreated()
        }
    }
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}
