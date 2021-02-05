import Foundation
import CoreData

extension Item {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }
    
    @NSManaged public var name: String
    @NSManaged public var order: Int32
    @NSManaged public var selected: Bool
    @NSManaged public var attribute: Attribute
    
}
