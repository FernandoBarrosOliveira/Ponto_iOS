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
    private let ref: DatabaseReference?
    
    init(name: String, ref: DatabaseReference ){
        self.name = name
        self.ref = ref.child("company")
        self.id = (ref.childByAutoId().key)
        // colocar essa referencia de forma global depois
        
    }
    
    init(id: String, name: String, ref: DatabaseReference){
        self.id = id
        self.name = name
        self.ref = ref
    }
    
    func toDictionary() -> Any{
        return [
            "id": id,
            "name": name
        ]
    }
    
    
    func create(company: Company) -> Void{
        ref?.child(self.id).setValue(company.toDictionary())
    }

}






