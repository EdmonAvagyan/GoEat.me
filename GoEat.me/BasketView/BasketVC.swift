//
//  BasketVC.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 30.01.23.
//

import UIKit
import CoreData

struct ImageItem {
    let name: String
    let image: UIImage
}

var noteList = [Note]()

class BasketVC: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var labelVC: UILabel!
    @IBOutlet weak var collectionVC: UICollectionView!
    
    var imageItem = [ImageItem]()
    let conteins: CGFloat = 8
    var firstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dizayn()
        fetchData()
        if (firstLoad) {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequest>(entityName: "Note")
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note
                    noteList.append(note)
                }
            }
            catch {
                print("Fetch Faild")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionVC.reloadData()
    }
    
    func dizayn() {
        view1.layer.cornerRadius = 30
        label1.textColor = .white
        label1.text = "093-34-05-58"
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
        imageItem = CacheManager.shared.loadImages()
        collectionVC.reloadData()
    }
    
}

extension BasketVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BasketCVC.id, for: indexPath) as? BasketCVC else {
            return UICollectionViewCell()
        }
        
        let thisNote: Note!
        thisNote = noteList[indexPath.row]
        
        cell.nameVC.text = thisNote.name
        cell.priceVC.text = thisNote.price
        
        cell.setupData(item: imageItem[indexPath.row])
        
        return cell
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeInItem(viewItem: collectionView)
    }
    
    func sizeInItem(viewItem: UICollectionView) -> CGSize {
        let widht = viewItem.layer.bounds.width
        let itemWidht = (widht - (conteins * 3)) / 2
        let itemHeight = itemWidht
        return CGSize(width: itemWidht, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let conteins = conteins
        return UIEdgeInsets(top: 24, left: conteins, bottom: conteins, right: conteins)
    }
    
    // top or bottom
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return conteins
    }
    
    // right or left
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return conteins
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = imageItem[indexPath.row]
        CacheManager.shared.deleteImage(with: item.name)
        fetchData()
    }
    
    
    
}

