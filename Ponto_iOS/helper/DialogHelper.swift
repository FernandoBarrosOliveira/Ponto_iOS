//
//  DialogHelper.swift
//  Ponto_iOS
//
//  Created by Fernando Barros on 12/05/2018.
//

import Foundation
import UIKit

public class DialogHelper{
    
    public static func dialogoErro(mensagemErro: String, view: UIViewController){
        let alert = UIAlertController(title: "Erro", message: mensagemErro, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(closeAction)
        view.present(alert, animated: true, completion: nil)
        
    }
    
}


