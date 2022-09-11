//
//  ViewController.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI(){
        btnSignIn.setCornerRadious(radious: 10.0)
        btnSignUp.setCornerRadious(radious: 10.0)
        let userdefault = UserDefaults.standard
        if let dict = userdefault.value(forKey: "LoginDetail") as? [String:String]{
            if let empDetail : EmpDetail = DatabaseHelper.sharedInstance.getEmpData(email: dict["email"]!, password: dict["password"]!){
                print(empDetail)
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }

    }
    
    
    
    @IBAction func btnTapped(_ sender:UIButton){
        if sender == btnSignIn{
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
            self.navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

