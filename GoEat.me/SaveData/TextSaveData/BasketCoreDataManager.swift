//
//  BasketCoreDataManager.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 08.04.23.
//

import Foundation
import CoreData

protocol BasketCoreDataProtocol {
    func saveBasket(with product: Basket)
    func getBaskets() -> [Basket]
    func getBasket(id: String) -> Basket?
    func deleteBasket(id: String)
}

class BasketCoreDataManager {
    
    static let shared = BasketCoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension BasketCoreDataManager: BasketCoreDataProtocol {
    func saveBasket(with product: Basket) {
        let item = MyBasket(context: context)
        item.id = product.id
        item.name = product.name
        item.price = product.price
        item.imageName = product.name
        item.isBuy = product.isBuy
        saveData()
    }
    
    func getBaskets() -> [Basket] {
        let request: NSFetchRequest<MyBasket> = MyBasket.fetchRequest()
        let myBaskets = try? context.fetch(request)
        let items = myBaskets?.compactMap { $0.toBasket() }
        return items ?? []
    }
    
    func getBasket(id: String) -> Basket? {
        let request: NSFetchRequest<MyBasket> = MyBasket.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let item = try? context.fetch(request).first
        let basket = item?.toBasket()
        return basket ?? nil
    }
    
    func deleteBasket(id: String) {
        let request: NSFetchRequest<MyBasket> = MyBasket.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        guard let item = try? context.fetch(request).first else { return }
        context.delete(item)
        saveData()
    }
    
    func saveData() {
        try? context.save()
    }
}
