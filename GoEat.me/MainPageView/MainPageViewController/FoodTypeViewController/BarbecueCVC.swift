//
//  BarbecueCVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 10.02.23.
//

import UIKit
import CoreData

class BarbecueCVC: UICollectionViewCell {
    
    static let id = "BarbecueCVC"
    static let nib = UINib(nibName: "BarbecueCVC", bundle: nil)
  
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var labelGin: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var buttonVC: UIButton!
    
    var buttonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dizayn()
        contentView.autoresizingMask = [.flexibleBottomMargin, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleWidth]
    }
    
    func dizayn() {
        buttonVC.layer.cornerRadius = 18
        imageVC.layer.cornerRadius = 30
    }
    
    func setupData(item: Product) {
        imageVC.image = item.image
        labelName.text = item.name
        labelGin.text = item.price
    }
    
    @IBAction func buttonVCAction(_ sender: Any) {
        buttonAction?()
    }
}
