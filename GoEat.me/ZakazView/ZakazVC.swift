//
//  ZakazVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 22.02.23.
//


import UIKit
import FirebaseFirestore

class ZakazVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labelVC: UILabel!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var cshTF: UITextField!
    @IBOutlet weak var housingTF: UITextField!
    @IBOutlet weak var houseTF: UITextField!
    @IBOutlet weak var floorTF: UITextField!
    @IBOutlet weak var deliveryCommentTF: UITextField!    
    @IBOutlet weak var saveVC: UIButton!
    @IBOutlet weak var cancelVC: UIButton!
    
    var product: Product?
    var delivery: Delivery?

    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "093-34-05-58"
        image2.tintColor = .white
        saveVC.layer.cornerRadius = 30
        cancelVC.layer.cornerRadius = 30
        labelVC.text = "Delivery"
        labelVC.layer.cornerRadius = 25
        labelVC.textColor = .white
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if let item = product, let item1 = delivery {
            NetworkManager.shared.insertData(item: item, item1: item1)
        }
//        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stroryboard.instantiateViewController(withIdentifier: "MainPage") as! MainPage
//        vc.modalTransitionStyle = .coverVertical
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
        dismiss(animated: true)
        
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
