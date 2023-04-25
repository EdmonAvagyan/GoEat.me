//
//  BasketVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 30.01.23.
//

import UIKit
import CoreData

class BasketVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labelVC: UILabel!
    @IBOutlet weak var collectionVC: UICollectionView!
    
    var basketsData = [Basket]() {
        didSet {
            collectionVC.reloadData()
        }
    }
    
    var products: [Product] = []
    let conteins: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionData()
        dizayn()
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
        labelVC.text = "Basket"
        labelVC.layer.cornerRadius = 25
        labelVC.textColor = .white
    }
    
    func collectionData() {
        collectionVC.delegate = self
        collectionVC.dataSource = self
        collectionVC.register(BasketCVC.nib, forCellWithReuseIdentifier: BasketCVC.id)
    }
    
    func fetchData() {
        basketsData = BasketCoreDataManager.shared.getBaskets().filter { $0.isBuy == false }
        print(basketsData)
    }
    
}

extension BasketVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basketsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketCVC.id, for: indexPath) as? BasketCVC else {
            return UICollectionViewCell()
        }
        
        let item = basketsData[indexPath.row]
        cell.setupData(item: basketsData[indexPath.row])
        cell.deleteItem = { [self] in
            let items = Basket(id: item.id, name: item.name, imageName: item.imageName, price: item.price, isBuy: true)
            BasketCoreDataManager.shared.deleteBasket(id: items.id)
            fetchData()
        }
        
        return cell
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeInItem(viewItem: collectionView)
    }
    
    func sizeInItem(viewItem: UICollectionView) -> CGSize {
        let widht = viewItem.layer.bounds.width
        let itemWidht =  (widht - (conteins * 3)) / 2
        let itemHeight = itemWidht
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
        let nextVC = storyboard.instantiateViewController(withIdentifier: "OpenBasketVC") as! OpenBasketVC
        nextVC.basket = basketsData[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

