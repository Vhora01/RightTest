//
//  SignupVC.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import UIKit

class SignupVC: UITableViewController  ,UITextFieldDelegate{

    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfConfirmPass: UITextField!
    
    
    @IBOutlet weak var btnSignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSignUp.setCornerRadious(radious: 10.0)
    }

    @IBAction func btnSignUpTapprd(_ sender: UIButton) {
        let model = SignUPModel(email: tfEmail.text!, name: tfName.text!, password: tfPassword.text!, confirmPass: tfConfirmPass.text!)
        model.validateModel(completionHandler: { msg in
            if let message = msg{
                Alert.showAlert(error: ("",message,"OK")) { tapOk in}
            }else{
                DatabaseHelper.sharedInstance.save(model: model) { msg, error in
                    if let message = msg{
                        Alert.showAlert(error: ("",message,"OK")) { tapOk in
                            self.tfName.text = ""
                            self.tfEmail.text = ""
                            self.tfPassword.text = ""
                            self.tfConfirmPass.text = ""
                            self.navigationController?.popViewController(animated: true)
                        }

                    }else{
                        Alert.showAlert(error: ("",error!.localizedDescription,"OK"))
                    }
                }
            }
        })
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 8
    }
    
    //MARK:- TextField Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
//    - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//        if (textField == self.tfPassword && !self.tfPassword.secureTextEntry) {
//            self.passwordTextField.secureTextEntry = YES;
//        }
//
//        return YES;
//    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == tfPassword && !tfPassword.isSecureTextEntry) {
            self.tfPassword.isSecureTextEntry = true
        }else if (textField == tfConfirmPass && !tfConfirmPass.isSecureTextEntry){
            self.tfConfirmPass.isSecureTextEntry = true

        }
        return true
    }
    
    
}
