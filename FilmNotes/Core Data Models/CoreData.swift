import CoreData

class CoreData: NSObject {
    
    static let stack = CoreData()   // Singleton
    
    // MARK:  Core Data stack
    
    // private lazy var persistentContainer: NSPersistentContainer = {
        
    //     let container = NSPersistentContainer(name: "SwiftUI_Core_Data_Test")
    //     container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    //         if let nserror = error as NSError? {
    //             fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    //         }
    //     })
    //     return container
    // }()

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentCloudKitContainer(name: "com.martinmclean.CoreDataCloudKitDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public var context: NSManagedObjectContext {
        
        get {
            return self.persistentContainer.viewContext
        }
    }
    
    // MARK: Core Data Saving support
    
    public func save() {
        
        if self.context.hasChanges {
            do {
                try self.context.save()
                print("In CoreData.stack.save()")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: Database setup
    
    public class func initialDbSetup() -> Void {
        
        if Item.count() == 1 {
            for i in 1...1 {
                let item = Item.createItem(name: "Item \(i)", order: i)
                for j in 1...1 {
                    _ = Attribute.createAttributeFor(item: item, name: "Attribute \(i).\(j)", order: j)
                }
            }
        }
    }
    
    // MARK: Managed Object Helpers
    
    class func executeBlockAndCommit(_ block: @escaping () -> Void) {
        
        block()
        CoreData.stack.save()
    }

}
