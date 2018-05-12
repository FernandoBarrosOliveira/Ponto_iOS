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
            DialogHelper.dialogoErro(mensagemErro: "Existe campos vazios", view: self)

            
        }else
        if passwordRegisterTextField.text != confirmPasswordTextField.text {
            DialogHelper.dialogoErro(mensagemErro: "Password não são iguais", view: self)
            
        }else{
            Auth.auth().createUser(withEmail: userTextFields.text!, password: passwordRegisterTextField.text!, completion: { (user, error) in
                if error == nil{
                    print("usuario criado")
                    
                }else{
                    DialogHelper.dialogoErro(mensagemErro: "Erro ao cadastrar", view: self)
                    print(error.debugDescription)
                }
                
                
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
