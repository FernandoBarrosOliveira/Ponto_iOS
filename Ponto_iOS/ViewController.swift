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
        
        Auth.auth().addStateDidChangeListener({ (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "GroupToDoList", sender: nil)
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

