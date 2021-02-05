import SwiftUI
import CoreData

struct AttributesGroupedView: View {
    
    @State private var editMode: EditMode = .inactive
    
    @ObservedObject var dataSource = CoreDataDataSource<Attribute>(sortKey1: "item.order",
                                                                   sortKey2: "order",
                                                                   sectionNameKeyPath: "item.name")
    
    var body: some View {
        
        NavigationView {
            List() {
                
                ForEach(self.dataSource.sections, id: \.name) { section in
                    
                    Section(header: Text("EXPOSURES ON \(section.name)"))
                    {
                        ForEach(self.dataSource.objects(inSection: section)) { attribute in
                            
                            if self.editMode == .active {
                                AttributeListCell(name: attribute.name, order: attribute.order)
                            } else {
                                NavigationLink(destination: AttributeEditView(attribute: attribute))
                                    { AttributeListCell(name: attribute.name, order: attribute.order) }
                            }
                        }
                        .onMove { self.dataSource.move(from: $0, to: $1, inSection: section ) }
                        .onDelete { self.dataSource.delete(from: $0, inSection: section) }
                    }
                }
            }
            .onAppear(perform: { self.onAppear() })
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Shoe Box"), displayMode: .large)
            .navigationBarItems(trailing: EditButton() )
            .environment(\.editMode, self.$editMode)
        }
    }
    
    public func onAppear() {
        
    }
}

#if DEBUG
struct AttributesGroupedView_Previews: PreviewProvider {
    static var previews: some View {
        AttributesGroupedView()
    }
}
#endif
