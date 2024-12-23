//
//  CoreDataServices 2.swift
//  Common
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

@preconcurrency import CoreData

public class CoreDataServices {
    nonisolated(unsafe) public static let instance = CoreDataServices()
    public static let name = "Berita_In"

    public let model: NSManagedObjectModel = {
        guard let modelURL = Bundle.module.url(forResource: CoreDataServices.name, withExtension: "momd"),
              let model = NSManagedObjectModel(contentsOf: modelURL)
        else { fatalError("Cannot find Core Data Model") }
        return model
    }()

    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataServices.name, managedObjectModel: model)
        container.loadPersistentStores { _, error in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        }

        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.automaticallyMergesChangesFromParent = true

        return container
    }()

    public var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    public func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
