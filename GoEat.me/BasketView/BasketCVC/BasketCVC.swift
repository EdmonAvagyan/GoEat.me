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
    @IBOutlet weak var addVC: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func dizayn() {
        addVC.layer.cornerRadius = 18
        imageVC.layer.cornerRadius = 30
    }
    
    func setupData(item: ImageItem) {
        imageVC.image = UIImage(named: item.name)
    }

    @IBAction func addAction(_ sender: Any) {
    }
}
