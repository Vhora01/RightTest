//
//  SignInVC.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import UIKit

class SignInVC: UITableViewController ,UITextFieldDelegate{

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnSignIn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignIn.setCornerRadious(radious: 10.0)
    }
    
    
    
    
    @IBAction func btnSignInTapped(_ sender: UIButton) {
        
        let model = SignInModel(email: tfEmail.text!, password: tfPassword.text!)
        model.validateModel(completionHandler: {(msg) in
            if let message = msg{
                Alert.showAlert(error: ("",message,"OK")) { tapOk in}
            }else{
                if let dict = DatabaseHelper.sharedInstance.login(email: self.tfEmail.text!, password: self.tfPassword.text!){
                    let userdefault = UserDefaults.standard
                    userdefault.set(dict, forKey: "LoginDetail")
                    userdefault.synchronize()
                    
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    self.navigationController?.pushViewController(controller, animated: true)
                    
                }else{
                    Alert.showAlert(error: ("","Please enter valid credentails","OK")) { tapOk in}
                }
            }
        })
    }
    //MARK:- TableView Datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    //MARK:- TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
