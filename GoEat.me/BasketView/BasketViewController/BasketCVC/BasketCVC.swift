//
//  BasketCVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 18.02.23.
//

import UIKit

class BasketCVC: UICollectionViewCell {
    
    static let id = "BasketCVC"
    static let nib = UINib(nibName: "BasketCVC", bundle: nil)
    
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var nameVC: UILabel!
    @IBOutlet weak var priceVC: UILabel!
    @IBOutlet weak var deleteVC: UIButton!
    
    var basketsData = [Basket]()
    var deleteItem: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dizayn()
        contentView.autoresizingMask = [.flexibleBottomMargin, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleWidth]
    }
    
    func dizayn() {
        deleteVC.layer.cornerRadius = 18
        imageVC.layer.cornerRadius = 30
    }
    
    func setupData(item: Basket) {
        imageVC.layer.masksToBounds = true
        imageVC.image = UIImage(named: item.imageName)
        priceVC.text = item.price
        nameVC.text = item.name
    }

    @IBAction func deleteAction(_ sender: Any) {
        deleteItem?()
    }
}
