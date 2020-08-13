//
//  CoreDataManager.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import Foundation
import CoreData

public class CoreDataManager {
    
    public static let sharedManager = CoreDataManager()
    
    public lazy var persistanceContainer: NSPersistentContainer = {
        
        let bundle = Bundle(for: CoreDataManager.self)
        guard let mom = NSManagedObjectModel.mergedModel(from: [bundle]) else {
            fatalError()
        }
        let container = NSPersistentContainer(name: "IncommingDataModel", managedObjectModel: mom)
        
        let storeURL = URL.storeURL(for: "group.group1.FlowApp.horacioguzman.com", databaseName: "FlowAppDatabase")
        let storeDescription = NSPersistentStoreDescription(url: storeURL)
        
        container.persistentStoreDescriptions = [storeDescription]
        
        container.loadPersistentStores { (description, error) in
            
        }
        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        return container
    }()
    
    public func start() {
        _ = self.persistanceContainer
    }
    
    public func saveContext() {
        let context = self.persistanceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error.localizedDescription)")
            }
        }
    }
    
    func incommingCount() {
        let context = persistanceContainer.viewContext
        let request: NSFetchRequest<Incomming> = Incomming.fetchRequest()
        let count = try? context.count(for: request)
        print("Coredata Incomming count \(count ?? -1)")
    }
    
    public static func getAll() -> NSFetchRequest<Incomming> {
        let request: NSFetchRequest<Incomming> = Incomming.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    public func createIncomming(_ value: Double,_ isIncomming: Bool,_ itemDescription: String) {
        let incomming = Incomming(context: persistanceContainer.viewContext)
        incomming.value = value
        incomming.isIncomming = isIncomming
        incomming.itemDescription = itemDescription
        incomming.date = Date()
        saveContext()
        incommingCount()
    }
}

public extension URL {

    /// Returns a URL for the given app group and database pointing to the sqlite database.
    static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }

        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
}
