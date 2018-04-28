//
//  PontoViewController.swift
//  Ponto_iOS
//
//  Created by fa7labs on 28/04/18.
//

import UIKit

class PontoViewController: UIViewController {

    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    
    let dateFormatterDate = DateFormatter()
    let dateFormatterTime = DateFormatter()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatterDate.dateFormat = "dd/MM/yyyy"
        dateFormatterTime.dateFormat = "hh:mm:ss"
//        dateFormatterDate.dateStyle = .medium
//        dateFormatterDate.timeStyle = .none
//
//        dateFormatterTime.dateStyle = .none
//        dateFormatterTime.timeStyle = .medium
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateLabel() -> Void {
        
        let now = Date()
        currentDateLabel.text = dateFormatterDate.string(from: now);
        currentTimeLabel.text = dateFormatterTime.string(from: now);
    }

}
