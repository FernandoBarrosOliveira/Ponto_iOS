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
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        if (userTextFields.text?.isEmpty)! ||
            (passwordRegisterTextField.text?.isEmpty)! ||
            (confirmPasswordTextField.text?.isEmpty)!{
            let alert = UIAlertController(title: "Erro", message: "Existe campos vazios", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
            
        }else
        if passwordRegisterTextField.text != confirmPasswordTextField.text {
            let alert = UIAlertController(title: "Erro", message: "Password não são iguais", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)

            
        }else{
            Auth.auth().createUser(withEmail: userTextFields.text!, password: passwordRegisterTextField.text!, completion: { (user, error) in
                
                
                print("usuario criado")
            })

            
        }

        

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
