//
//  CadTimePunch.swift
//  Ponto_iOS
//
//  Created by Fernando Barros on 09/05/2018.
//
import Foundation
import Firebase


struct CadTimePunch{
    var company: Company
    var weekday: Int // criar um enum
    var enterTime: Date
    var intervalBegin: Date
    var intervalEnd: Date
    var leaveTime: Date
    var workHourDay: Date // fazer calculado de acordo com os horario
    //private var ref: DatabaseReference?
    
    
    func toDictionary() -> Any {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
        return [
            "company": company.toDictionary(),
            "weekday": weekday,
            "enterTime": dateFormatter.string(from: enterTime),
            "intervalBegin": dateFormatter.string(from: intervalBegin),
            "intervalEnd": dateFormatter.string(from: intervalEnd),
            "leaveTime": dateFormatter.string(from: leaveTime),
            "workHourDay": dateFormatter.string(from: workHourDay)
        ]
    }
    
    func create(timepuch: CadTimePunch) -> Void{
        let ref = Database.database().reference()
        ref.child("CadTimePunch").childByAutoId().setValue(timepuch.toDictionary())
    }
    
    
}


    
    

