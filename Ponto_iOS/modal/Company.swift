//
//  Company.swift
//  Ponto_iOS
//
//  Created by Fernando Barros on 07/05/2018.
//

import Foundation
import Firebase


struct Company{
    var id: String
    var name: String
    private var ref: DatabaseReference?
    
    init(name: String ){
        self.name = name
        ref = Database.database().reference().child("company") // colocar essa referencia de forma global depois
        self.id = (ref?.childByAutoId().key)!
    }
    
    func toDictionary() -> Any{
        return [
            "id": id,
            "name": name
        ]
    }
    
    
    func create(company: Company) -> Void{
        ref?.setValue(company.toDictionary())
    }

}




