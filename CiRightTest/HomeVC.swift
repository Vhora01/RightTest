//
//  HomeVC.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SignOut", style: .plain, target: self, action: #selector(signOut(_:)))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit(_:)))
        
    }
    @objc func signOut(_ sender:UIBarButtonItem){
        Alert.showAlertWithCancelButton(message: ("","Are you sure? Do you want to Sign Out","OK")) { tapOk in
            let userdefault = UserDefaults.standard
            userdefault.removeObject(forKey: "LoginDetail")
            userdefault.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
    }
    @objc func edit(_ sender:UIBarButtonItem){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as! EditVC
        self.navigationController?.pushViewController(controller, animated: true)

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
