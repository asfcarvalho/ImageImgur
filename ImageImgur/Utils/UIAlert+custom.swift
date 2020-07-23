//
//  UIAlert+extension.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 23/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import UIKit

class AlertCustom {
    
    static func showAlert(from viewController: UIViewController?, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        viewController?.present(alert, animated: true)
    }
}
