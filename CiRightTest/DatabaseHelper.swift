//
//  DatabaseHelper.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    static var sharedInstance = DatabaseHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(model:SignUPModel,completionHandler:@escaping(_ msg:String?,_ error:Error?)->()){
        let emp = NSEntityDescription.insertNewObject(forEntityName: "Emp", into: context!) as! Emp
        emp.name = model.name
        emp.email = model.email
        emp.password = model.password
        emp.confirmpass = model.confirmPass
        do{
            try context?.save()
            completionHandler("Data Saved...",nil)
        }catch{
            completionHandler(nil,error)
        }
    }
    
    func fetchAllData()->[Emp]{
        var empArr = [Emp]()
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Emp")
        do {
             empArr = try context?.fetch(fetchRequest) as! [Emp]

        }catch {
            print("Error====\(error)")
        }
        return empArr
    }
    
    
    
    
    
    
    func getEmpData(email:String,password:String)->EmpDetail?{
        var emp = [Emp]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Emp")
        do {
            emp = try context?.fetch(fetchRequest) as! [Emp]
            print(emp)

            let result = emp.filter { employee in
                employee.email == email && employee.password == password
            }
            print(result)
            
           return EmpDetail(name: result[0].name!, email: result[0].email!, password: result[0].password!, confirmpassword: result[0].confirmpass!)

        }catch{
            print("Error")
            return nil
        }
        return nil
    }
    
    func login(email:String,password:String)->[String:String]?{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Emp")
        do {
            let emp = try context?.fetch(fetchRequest) as! [Emp]
            let result = emp.contains { employee in
                employee.email == email && employee.password == password
            }
            
            return result ? ["email":email,"password":password] : nil
            
        }catch{
            print("Error")
            return nil
        }
    }
    
    func edit(email:String,name:String,password:String)->Bool{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Emp")
        fetchRequest.predicate = NSPredicate(format: "(email = %@)", email)
        
        do {
            let list = try context?.fetch(fetchRequest) as! [Emp]
            // Check notificationId available then not save
            if list.count != 0 {
                let objectUpdate = list[0] as! NSManagedObject
                objectUpdate.setValue(name, forKey: "name")
                objectUpdate.setValue(password, forKey: "password")
                
                do{
                    try context?.save()
                    return true
                }catch{
                    return false
                }
            }
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
            return false
        }
        return false

    }
    
    
}
