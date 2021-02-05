import Foundation

extension ListSelectionManager {
    subscript(member: T) -> Bool {
        get {
            return self.isSelected(member)
        }
        set {
            if newValue {
                self.select(member)
            } else {
                self.deselect(member)
            }
        }
    }
}

class ListSelectionManager<T: Hashable>: ObservableObject {
    
    init() {
        self.allowsMultipleSelections = true
    }
    
    init(allowsMultipleSelections: Bool) {
        self.allowsMultipleSelections = allowsMultipleSelections
    }
    
    private var allowsMultipleSelections: Bool
    
    @Published var selection: Set<T> = Set<T>()
    
    func select(_ value: T) {
        
        if !allowsMultipleSelections && self.selection.count > 0 {
            self.deselect(self.selection.first!)
        }
        self.selection.insert(value)
    }
    
    func deselect(_ value: T) {
        self.selection.remove(value)
    }
    
    func isSelected(_ value: T) -> Bool {
        return self.selection.contains(value)
    }
}
