//
//  PunchClock.swift
//  Ponto_iOS
//
//  Created by Fernando Barros on 09/05/2018.
//

import Foundation
import Firebase

struct PunchClock{
    var company: Company
    var weekday: Int
    var punch: Date
    
    func toDictionary() -> Any {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
        return [
            "company": company.toDictionary(),
            "weekday": weekday,
            "punch": dateFormatter.string(from:punch)
        ]
    }
    
    func create(punch: PunchClock){
        let ref = Database.database().reference()
        ref.child("PunchClock").childByAutoId().setValue(punch.toDictionary())
    }
    
    
}
