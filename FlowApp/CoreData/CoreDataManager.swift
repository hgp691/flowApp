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
        let container = NSPersistentContainer(name: "IncomingDataModel", managedObjectModel: mom)
        
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
    
    func incomingCount() {
        let context = persistanceContainer.viewContext
        let request: NSFetchRequest<Incoming> = Incoming.fetchRequest()
        let count = try? context.count(for: request)
        print("Coredata Incoming count \(count ?? -1)")
    }
    
    public static func getAll() -> NSFetchRequest<Incoming> {
        let request: NSFetchRequest<Incoming> = Incoming.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    public func createIncoming(_ value: Double,_ isIncoming: Bool,_ itemDescription: String) {
        let incoming = Incoming(context: persistanceContainer.viewContext)
        incoming.value = value
        incoming.isIncoming = isIncoming
        incoming.itemDescription = itemDescription
        incoming.date = Date()
        saveContext()
        incomingCount()
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
