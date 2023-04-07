//
//  RegisterVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 02.02.23.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!
    @IBOutlet weak var registerVC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        
    }
    
    @IBAction func registerAction(_ sender: Any) {
        guard let email = emailText.text, let pass = passwordText.text else { print("error"); return}
       creatUser(email: email, pass: pass)
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "093-34-05-58"
        image2.tintColor = .white
        label2.text = "Registration"
        label2.layer.cornerRadius = 20
        label2.clipsToBounds = true
        label2.textColor = .white
        registerVC.layer.cornerRadius = 20
        registerVC.tintColor = .white
    }
    
    func creatUser(email: String, pass: String) {
        Firebase.Auth.auth().createUser(withEmail: email, password: pass) { result, error in
            if let user = result?.user {
                self.sendAccountVC(email: user.email ?? "")
            }
            if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendAccountVC(email: String) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "AccountVC") as! AccountVC
            vc.email = email
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    
}
