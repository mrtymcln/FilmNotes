import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var searchPredicate: NSPredicate? = NSPredicate(format: "name contains[c] %@", "")
    
    @ObservedObject var dataSource = CoreDataDataSource<Attribute>()
    
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(text: $searchText, predicate: $searchPredicate)
                List {
                    Section(header: Text("EXPOSURES CONTAINING \(self.searchText)"))
                    {
                        ForEach(self.dataSource.loadDataSource(predicate: self.searchPredicate)) { attribute in
                            
                            AttributeListCell(name: attribute.name,
                                              order: attribute.order)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("Search"), displayMode: .large)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
