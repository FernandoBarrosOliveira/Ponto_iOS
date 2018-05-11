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
    
    init(name: String ){
        self.name = name
        ref = Database.database().reference().child("company") // colocar essa referencia de forma global depois
        self.id = (ref?.childByAutoId().key)!
    }
    
    init(id: String, name: String){
        self.id = id
        self.name = name
        self.ref = Database.database().reference().child("company")
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
    
    func listAll() -> [Company]{
        var userId = Auth.auth().currentUser?.uid
     
        ref?.child(userId!).observeSingleEvent(of: .value, with: { (snapshot) in
            var companies:[Company] = []
            for object in snapshot.children.allObjects as! [DataSnapshot]{
                let value = object.value as? NSDictionary
                
                companies.append(Company(id: value?["id"] as! String, name: value?["name"] as! String))
            }

        }) { (error) in
            print(error.localizedDescription)
        }
        return []
    
    }
}






