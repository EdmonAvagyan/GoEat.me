//
//  ZakazVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 22.02.23.
//


import UIKit
import FirebaseFirestore
import Firebase

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
    
    var delivery: Delivery?
    var basket: Basket?
    var buttonAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "0**-**-**-**"
        image2.tintColor = .white
        saveVC.layer.cornerRadius = 30
        cancelVC.layer.cornerRadius = 30
        labelVC.text = "Delivery"
        labelVC.layer.cornerRadius = 25
        labelVC.textColor = .white
    }
    
    func createDelivery() {
        delivery = Delivery(country: countryTF.text, csh: cshTF.text, housing: housingTF.text, house: houseTF.text, floor: floorTF.text, deliveryComment: deliveryCommentTF.text)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if Firebase.Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            present(nextVC, animated: true)
        } else {
            createDelivery()
            if let item = basket, let item1 = delivery {
                NetworkManager.shared.insertData(item: item, item1: item1)
                var basket = item
                basket.isBuy = true
                BasketCoreDataManager.shared.deleteBasket(id: item.id)
                BasketCoreDataManager.shared.saveBasket(with: basket)
            }
            dismiss(animated: true)
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
