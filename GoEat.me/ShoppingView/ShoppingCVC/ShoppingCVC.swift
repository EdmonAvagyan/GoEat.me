//
//  ShoppingCVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 19.02.23.
//

import UIKit

class ShoppingCVC: UICollectionViewCell {
    
    static let id = "ShoppingCVC"
    static let nib = UINib(nibName: "ShoppingCVC", bundle: nil)
    
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var labelVC: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dizayn()
    }
    
    func dizayn() {
        imageVC.layer.cornerRadius = 30
    }
    
    func setupData(text: String) {
        imageVC.image = UIImage(named: text)
    }

}
