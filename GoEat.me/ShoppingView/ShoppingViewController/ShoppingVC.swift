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
    
    var shoppingData = [Basket]() {
        didSet {
            collectionView.reloadData()
        }
    }
    var buttonAction: (() -> Void)?
    let conteins: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        collectionData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "0**-**-**-**"
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
    
    func fetchData() {
        shoppingData = BasketCoreDataManager.shared.getBaskets().filter { $0.isBuy == true }
        print(shoppingData)
    }

}

extension ShoppingVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCVC.id, for: indexPath) as? ShoppingCVC else {
            return UICollectionViewCell()
        }
        _ = shoppingData[indexPath.row]
        cell.setupData(item: shoppingData[indexPath.row])
        
        return cell
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeInItem(viewItem: collectionView)
    }
    
    func sizeInItem(viewItem: UICollectionView) -> CGSize {
        let widht = viewItem.layer.bounds.width
        let itemWidht =  (widht - (conteins * 3)) / 2
        let itemHeight = itemWidht * 1.3
        return CGSize(width: itemWidht, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: conteins, bottom: conteins, right: conteins)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return conteins
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return conteins
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "OpenShoppingVC") as! OpenShoppingVC
        nextVC.basket = shoppingData[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
