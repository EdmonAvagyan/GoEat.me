//
//  OpenVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 18.02.23.
//

import UIKit

class OpenVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var nameVC: UILabel!
    @IBOutlet weak var priiceVC: UILabel!
    @IBOutlet weak var addVC: UIButton!
    @IBOutlet weak var buyVC: UIButton!
    
    var myImage: UIImage?
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "093-34-05-58"
        image2.tintColor = .white
        addVC.layer.cornerRadius = 30
        buyVC.layer.cornerRadius = 30
        imageVC.layer.cornerRadius = 30
        imageVC.image = product?.image
        nameVC.text = product?.name
        priiceVC.text = product?.price
    }
    
    @IBAction func addAction(_ sender: Any) {
    }
    
    @IBAction func buyAction(_ sender: Any) {
        let stroryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroryboard.instantiateViewController(withIdentifier: "ZakazVC") as! ZakazVC
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        vc.product = product
        present(vc, animated: true)
//        if let item = product {
//            NetworkManager.shared.insertData(item: item)
//        }
    }
    

}
