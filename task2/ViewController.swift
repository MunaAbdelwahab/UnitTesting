//
//  ViewController.swift
//  task2
//
//  Created by Muna Abdelwahab on 3/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let apiClass = ApiClass()
    var json : Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            nameTF.delegate = self
            passwordTF.delegate = self
    }


    @IBAction func login(_ sender: Any) {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController")
        self.navigationController?.pushViewController(secondVC!, animated: true)
    }
    
    func getAllData(){
        apiClass.getApiData(urlString: "https://api.github.com/repositories") { (_json) in
            self.json = _json
        }
    }
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}

