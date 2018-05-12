//
//  CompanyViewController.swift
//  Ponto_iOS
//
//  Created by Fernando Barros on 11/05/2018.
//

import UIKit
import Firebase

class CompanyViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    var companyList = [Company]()
    var ref: DatabaseReference = Database.database().reference()
    var refCompany: DatabaseReference!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CompanyViewControllerTableViewCell
        let company: Company
        company = companyList[indexPath.row]
        cell.CompanyName.text = company.name
        return cell
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    @IBAction func saveCompany(_ sender: Any) {
        if (companyName.text?.isEmpty)!{
            
        }else {
            let company = Company(name: companyName.text!, ref: ref)
            company.create(company: company)
            
        }
    
    }
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var companyTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refCompany = ref.child("company")
        refCompany.observe(.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.companyList.removeAll()
                for companies in snapshot.children.allObjects as! [DataSnapshot]{
                    let companyObject = companies.value as? [String: AnyObject]
                    let Name = companyObject?["name"] as? String ?? ""
                    let ID = companyObject?["id"] as? String ?? ""

                    let company = Company(id: ID, name: Name, ref: self.ref)

                    self.companyList.append(company)

                }
                self.companyTableView.reloadData()
            }
            })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
