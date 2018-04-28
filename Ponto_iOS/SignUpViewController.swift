//
//  SignUpViewController.swift
//  Ponto_iOS
//
//  Created by Fernando Barros on 28/04/2018.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var userTextFields: UITextField!
    @IBOutlet weak var passwordRegisterTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUp(_ sender: Any) {

        
        Auth.auth().createUser(withEmail: userTextFields.text!, password: passwordRegisterTextField.text!, completion: { (user, error) in
        
            
            print("usuario criado")
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
