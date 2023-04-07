//
//  LoginVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 31.01.23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var textVC1: UITextField!
    @IBOutlet weak var textVC2: UITextField!
    @IBOutlet weak var buttonVC1: UIButton!
    @IBOutlet weak var buttonVC2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if let user = Firebase.Auth.auth().currentUser {
//            sendAccountVC(email: user.email ?? "")
//        }
    }
        func dizayn() {
            view1.layer.cornerRadius = 30
            label1.textColor = .white
            label1.text = "093-34-05-58"
            image2.tintColor = .white
            label2.text = "Sign In"
            label2.layer.cornerRadius = 20
            label2.clipsToBounds = true
            buttonVC1.layer.cornerRadius = 20
            buttonVC1.tintColor = .white
        }
        
        @IBAction func buttonAction1(_ sender: Any) {
            guard let email = textVC1.text, let pass = textVC2.text else { print("error"); return}
            signIn(email: email, pass: pass)
        }
        
        @IBAction func buttonAction2(_ sender: Any) {
            let stroryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = stroryboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
            navigationController?.pushViewController(nextVC, animated: true)
        }
        
        func signIn(email: String, pass: String) {
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pass) { result, error in
                if let user = result?.user {
                    self.sendAccountVC(email: user.email ?? "")
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
