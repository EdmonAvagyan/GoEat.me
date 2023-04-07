//
//  FoodTypeVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 06.03.23.
//

import UIKit

class FoodTypeVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labelVC: UILabel!
    @IBOutlet weak var collectionVC: UICollectionView!
    
    var foodName: String = ""
    var foodData: [Product] = []
    let conteins: CGFloat = 8
    
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
        labelVC.text = foodName
        labelVC.layer.cornerRadius = 25
        labelVC.textColor = .white
    }
    
    func collectionData() {
        collectionVC.delegate = self
        collectionVC.dataSource = self
        collectionVC.register(BarbecueCVC.nib, forCellWithReuseIdentifier: BarbecueCVC.id)
    }
    
}

extension FoodTypeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BarbecueCVC.id, for: indexPath) as? BarbecueCVC else {
            return UICollectionViewCell()
        }
        let item = foodData[indexPath.row]
        cell.setupData(item: item)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeInItem(viewItem: collectionView)
    }
    
    func sizeInItem(viewItem: UICollectionView) -> CGSize {
        let widht = viewItem.layer.bounds.width
        let itemWidht = (widht - (conteins * 3)) / 2
        let itemHeight = itemWidht
        return CGSize(width: itemWidht, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: conteins, left: conteins, bottom: conteins, right: conteins)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return conteins
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return conteins
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "OpenVC") as! OpenVC
        nextVC.product = foodData[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
