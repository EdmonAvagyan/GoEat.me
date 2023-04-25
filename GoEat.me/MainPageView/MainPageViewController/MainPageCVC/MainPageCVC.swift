//
//  MainPageCVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 30.01.23.
//

import UIKit

class MainPageCVC: UICollectionViewCell {
    
    static let id = String(describing: MainPageCVC.self)
    static let nib = UINib(nibName: "MainPageCVC", bundle: nil)
    
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var labelVC: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageVC.layer.cornerRadius = 30
        
    }
    
    func setupData(item: Category) {
        imageVC.backgroundColor = .red
        imageVC.image = item.image
        labelVC.text = item.name
    }
    
    

}
