//
//  EditVC.swift
//  CiRightTest
//
//  Created by Prakash on 26/05/22.
//

import UIKit

class EditVC: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnEdit: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userdefault = UserDefaults.standard
        if let dict = userdefault.value(forKey: "LoginDetail") as? [String:String]{
            if let empDetail : EmpDetail = DatabaseHelper.sharedInstance.getEmpData(email: dict["email"]!, password: dict["password"]!){
                print(empDetail)
                setupUI(object: empDetail)
            }
        }

    }
    
    private func setupUI(object:EmpDetail){
        tfName.text = object.name
        tfEmail.text = object.email
        tfPassword.text = object.password
        btnEdit.setCornerRadious(radious: 10.0)
    }
    @IBAction func btnEditTapped(_ sender: UIButton) {
        if DatabaseHelper.sharedInstance.edit(email: tfEmail.text!, name: tfName.text!, password: tfPassword.text!){
            Alert.showAlert(error: ("","Record Updated","OK"))
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
