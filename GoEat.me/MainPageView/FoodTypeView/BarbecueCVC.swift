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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dizayn()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageVC.image = nil
        labelGin.text = nil
        labelName.text = nil
    }
    
    func dizayn() {
        buttonVC.layer.cornerRadius = 18
        imageVC.layer.cornerRadius = 30
//        imageVC.clipsToBounds = true
//        imageVC.layer.masksToBounds = false
    }
    
    func setupData(item: Product) {
        imageVC.image = item.image
        labelName.text = item.name
        labelGin.text = item.price
    }

    @IBAction func buttonVCAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let newNote = Note(entity: entity!, insertInto: context)
        newNote.id = noteList.count as NSNumber
        newNote.name = Product.name
        newNote.price = Product.price
        do {
            try context.save()
            noteList.append(newNote)
        }
        catch {
            print("context save error")
        }
    }
}
