//
//  Alert.swift
//  CiRightTest
//
//  Created by Prakash on 25/05/22.
//

import UIKit
class Alert {
    
    class func showAlert(error: (String, String, String), okAction: ((_ tapOk: Bool) -> Void)? = nil) {
        let alert = UIAlertController(title: error.0, message: error.1, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: error.2, style: .default, handler: { _ in
            if let okAction = okAction { okAction(true) }
        }))
        showAlertAtTopVC(alert: alert)
    }
    
    
    
    class func showAlertWithCancelButton(message: (String, String, String), okAction: ((_ tapOk: Bool) -> Void)? = nil) {
        let alert = UIAlertController(title: message.0, message: message.1, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: message.2, style: .default, handler: { _ in
            if let okAction = okAction { okAction(true) }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        showAlertAtTopVC(alert: alert)
    }
    
    class func showVideoGenerationAlert(error: (String, String, String, String), completion: @escaping ((_ tapOk: Bool) -> Void)) {
        let alert = UIAlertController(title: error.0, message: error.1, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: error.2, style: .default) { UIAlertAction in
            completion(true)
        })
        alert.addAction(UIAlertAction(title: error.3, style: .default) { UIAlertAction in
            completion(false)
        })
        showAlertAtTopVC(alert: alert)
    }
    
    class func showAlertAtTopVC(alert: UIAlertController) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alert, animated: true)
        }
    }
}
