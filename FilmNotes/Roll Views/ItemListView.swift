import SwiftUI
import CoreData

struct ItemListView : View {
    
    @State private var editMode: EditMode = .inactive
    
    @ObservedObject var dataSource = CoreDataDataSource<Item>()
    
    @State var sortAscending: Bool = true
    
    var body: some View {
        
        NavigationView {
            List() {
                
                Section(header:
                            HStack {
                                Text("FILM ROLLS")
                                Spacer()
                                Image(systemName: (sortAscending ? "arrow.down" : "arrow.up"))
                                    .foregroundColor(.blue)
                                    .onTapGesture(perform: self.onToggleSort )
                            }
                )
                {
                    
                    ForEach(dataSource.fetchedObjects) { item in
                        
                        if self.editMode == .active {
                            ItemListCell(name: item.name, order: item.order, check: item.selected)
                        } else {
                            NavigationLink(destination: ItemEditView(item: item))
                                { ItemListCell(name: item.name, order: item.order, check: item.selected) }
                        }
                    }
                    .onMove(perform: (self.sortAscending ? self.dataSource.move : nil)) /// Move only allowed if ascending sort
                    .onDelete(perform: self.dataSource.delete)
                }
            }
            .onAppear(perform: { self.onAppear() })
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Camera"), displayMode: .large)
            .navigationBarItems(trailing:
                                    HStack {
                                        EditButton()
                                            .padding()
                                        AddButton(destination: ItemAddView())
                                    } )
            .environment(\.editMode, self.$editMode)
        }
    }
    
    public func onAppear() {
        self.dataSource.loadDataSource()
    }
    
    public func onToggleSort() {
        self.sortAscending.toggle()
        self.dataSource.changeSort(key: "order", ascending: self.sortAscending)
    }
    
}

#if DEBUG
struct ItemListView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemListView()
        }
    }
}
#endif
