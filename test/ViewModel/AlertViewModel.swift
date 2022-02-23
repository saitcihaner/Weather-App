//
//  AlertViewModel.swift
//  test
//
//  Created by Sait Cihaner on 23.02.2022.
//

import Foundation
import UIKit

class AlertViewModel{
    func createAlert(message:String,alertType:Situation)->UIAlertController?{
        var alert : UIAlertController? = nil
       
        switch alertType {
        case .success:
          
            alert = UIAlertController.init(title: "Hava Durumu", message: message, preferredStyle: .actionSheet)
            break
        case .failure:
           alert = UIAlertController.init(title: "Hata", message: message, preferredStyle: .alert)
break
        }
        alert?.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        return alert
    }
}

enum Situation{
    case success
    case failure
}
