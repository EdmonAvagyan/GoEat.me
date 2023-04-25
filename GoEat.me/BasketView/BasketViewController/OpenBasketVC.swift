//
//  OpenBasketVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 22.02.23.
//

import UIKit

class OpenBasketVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var nameVC: UILabel!
    @IBOutlet weak var priiceVC: UILabel!
    @IBOutlet weak var buyVC: UIButton!
    
    var basket: Basket?

    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "0**-**-**-**"
        image2.tintColor = .white
        imageVC.clipsToBounds = true
        imageVC.layer.cornerRadius = 30
        buyVC.layer.cornerRadius = 30
        if let imageName = basket?.imageName {
            imageVC.image = UIImage(named: imageName)
        }
        nameVC.text = basket?.name
        priiceVC.text = basket?.price
    }
    
    @IBAction func buyAction(_ sender: Any) {
        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = stroryboard.instantiateViewController(withIdentifier: "ZakazVC") as! ZakazVC
        nextVC.modalTransitionStyle = .coverVertical
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.basket = basket
        present(nextVC, animated: true)
    }
}
