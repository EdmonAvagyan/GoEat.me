//
//  AccountVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 12.02.23.
//

import UIKit
import Firebase

class AccountVC: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var logoutbutton: UIButton!
    
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
    }
    

    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "0**-**-**-**"
        image2.tintColor = .white
        label2.text = "Account"
        label2.layer.cornerRadius = 20
        label2.clipsToBounds = true
        label2.textColor = .white
        logoutbutton.layer.cornerRadius = 15
        labelName.text = Firebase.Auth.auth().currentUser?.email ?? ""
    }

    @IBAction func logoutaction(_ sender: Any) {
        do {
            try Firebase.Auth.auth().signOut()
            if let parent = tabBarController as? TabBarVC {
                parent.setupVCs()
            }
            dismiss(animated: true)
            navigationController?.popViewController(animated: true)
        } catch {
            print("catch error")
        }
    }
}
