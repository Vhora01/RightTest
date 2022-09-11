//
//  SignInModel.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import Foundation


struct SignInModel{
    var email : String
    var password :String
    
    init(email:String,password:String) {
        self.email = email
        self.password = password
        
    
    }
    func validateModel(completionHandler:@escaping(_ msg:String?)->()){
        if email.isEmpty{
            completionHandler("Please enter email")
        }
        else if !email.isValidEmail(){
            completionHandler("Enter Valid Email.")
        }else if password.isEmpty{
            completionHandler("Please Enter Password")
        }else {
            completionHandler(nil)
        }
    }
}

struct SignUPModel{
    var email : String
    var name : String
    var password :String
    var confirmPass : String
    
    func validateModel(completionHandler:@escaping(_ msg:String?)->()){
        if name.isEmpty{
            completionHandler("Please enter name")
        }
        else if email.isEmpty{
            completionHandler("Please enter email")
        }
        else if !email.isValidEmail(){
            completionHandler("Enter Valid Email.")
        }else if password.isEmpty{
            completionHandler("Please Enter Password")
        }
        else if confirmPass.isEmpty{
            completionHandler("Please Enter Confirm Password")
        }else if password != confirmPass{
            completionHandler("Password and Confirm password is not same")
        }else{
            completionHandler(nil)
        }
        
    }
}


struct EmpDetail{
    var name:String
    var email :String
    var password : String
    var confirmpassword : String
}
