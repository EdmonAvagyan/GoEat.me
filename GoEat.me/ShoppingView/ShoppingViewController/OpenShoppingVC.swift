//
//  OpenShoppingVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 22.02.23.
//

import UIKit

class OpenShoppingVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var nameVC: UILabel!
    @IBOutlet weak var priiceVC: UILabel!
    
    var basket: Basket?

    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        
    }
    
    func dizayn() {
        imageVC.clipsToBounds = true
        imageVC.layer.cornerRadius = 30
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "0**-**-**-**"
        image2.tintColor = .white
        if let imageName = basket?.imageName {
            imageVC.image = UIImage(named: imageName)
        }
        nameVC.text = basket?.name
        priiceVC.text = basket?.price
    }

}
