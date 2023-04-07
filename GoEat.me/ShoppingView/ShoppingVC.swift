//
//  ShoppingVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 02.02.23.
//

import UIKit

class ShoppingVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labelVC: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var shop = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        collectionData()
        
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "093-34-05-58"
        image2.tintColor = .white
        labelVC.text = "Shop"
        labelVC.layer.cornerRadius = 25
        labelVC.textColor = .white
    }
    
    func collectionData() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShoppingCVC.nib, forCellWithReuseIdentifier: ShoppingCVC.id)
    }

}

extension ShoppingVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shop.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCVC.id, for: indexPath) as? ShoppingCVC else {
            return UICollectionViewCell()
        }
        
        cell.setupData(text: shop[indexPath.row])
        
        return cell
    }
    
    
}
