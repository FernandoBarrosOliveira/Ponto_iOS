//
//  ViewController.swift
//  Ponto_iOS
//
//  Created by fa7labs on 28/04/18.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
  
    

    
    @IBAction func Login(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginTextField.text!, password: senhaTextField.text!, completion: { (user, error) in
            
            print("Acabei de logar")
            })
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let company = Company.init(name: "FCM Sistemas")
        company.create(company:  company);
        //Firestore.firestore().collection("company").addDocument(data: company.dictionary)
        
  
        
        let timePunch = CadTimePunch.init(company: company, weekday: 1, enterTime: Date(), intervalBegin: Date(), intervalEnd: Date(), leaveTime: Date(), workHourDay: Date())
        timePunch.create(timepuch: timePunch)
        
        let punch = PunchClock.init(company: company, weekday: 1, punch: Date())
        punch.create(punch: punch)
       // Firestore.firestore().collection("cadtimepunch").addDocument(data: timePunch.dictionary)
        
        /*
        Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "GroupToDoList", sender: nil)
            }
        })*/
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

