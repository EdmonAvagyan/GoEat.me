//
//  ImageCoreDataManager.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 02.03.23.
//

import Foundation
import CoreData

class ImageCoreDataManager {
    
    static let shared = ImageCoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ImageDB")
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

extension ImageCoreDataManager {
    
    func saveImage(with id: String) {
        let item = ImageModel(context: context)
        item.id = id
        saveData()
    }
    
    func getImages() -> [ImageModel] {
        let request: NSFetchRequest<ImageModel> = ImageModel.fetchRequest()
        let items = try? context.fetch(request)
        return items ?? []
    }
    
    func getImage(id: String) -> ImageModel? {
        let request: NSFetchRequest<ImageModel> = ImageModel.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        let item = try? context.fetch(request).first
        return item ?? nil
    }
    
    func deleteImage(with image: ImageModel) {
        context.delete(image)
        saveData()
    }
    
    func saveData() {
        try? context.save()
    }
}
