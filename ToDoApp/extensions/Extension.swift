//
//  Extension.swift
//  ToDoApp
//
//  Created by Riza Erdi Karakus on 30.12.2021.
//

import UIKit

extension UIViewController{
    func alertTimer(title:String?,mesaj:String?){
        let alert = UIAlertController(title: "", message: mesaj, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }
    }
}
