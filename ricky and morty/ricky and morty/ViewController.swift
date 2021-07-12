//
//  ViewController.swift
//  ricky and morty
//
//  Created by V UMESH KUMAR RAJU on 11/07/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet var serchTextField: UITextField!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        serchTextField.endEditing(true)
        print(serchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if serchTextField.text != ""{
            return true
        }
        else{
            serchTextField.placeholder = "Enter "
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        serchTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serchTextField.layer.cornerRadius = 10
    }


}

