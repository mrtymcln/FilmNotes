import SwiftUI

struct ItemEditView : View {
    
    @State private var editMode: EditMode = .inactive

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var item: Item
    
    @State var textFilmStock: String = ""
    @State var textOrder: String = ""
    
    @ObservedObject var dataSource = CoreDataDataSource<Attribute>(predicateKey: "item")
    
    var body: some View {
        
        Form {
            
            ItemFormView(textFilmStock: self.$textFilmStock,
                         textOrder: self.$textOrder,
                         editMode: self.$editMode)
             
            Section(header: Text("exposures_attributes".uppercased())) {
                ForEach(dataSource.loadDataSource(relatedTo: item)) { attribute in
                    
                    if self.editMode == .active {
                        AttributeListCell(name: attribute.name, order: attribute.order)
                    } else {
                        NavigationLink(destination: AttributeEditView(attribute: attribute))
                        { AttributeListCell(name: attribute.name, order: attribute.order) }
                    }
                }
                .onMove(perform: self.dataSource.move)
                .onDelete(perform: self.dataSource.delete)
            }
        }
        .onAppear(perform: { self.onAppear() })
        .navigationBarTitle(Text("\(self.editMode == .active ? "Edit" : "View") Roll"),
                            displayMode: .inline)
        .navigationBarItems(trailing:
            HStack {
                EditSaveDoneButton(editAction: { self.editMode = .active },
                                   saveAction: { self.saveAction() },
                                   doneAction: { self.editMode = .inactive },
                                   dirty: self.dirty() )
                    .padding()
                AddButton(destination: AttributeAddView(item: item))
            }
        )
        .environment(\.editMode, self.$editMode)
    }
    
    func onAppear() {
        
        self.textFilmStock = self.item.name
        self.textOrder = String(self.item.order)
    }
    
    func cancelAction() {
        
        self.textFilmStock = ""
        self.textOrder = ""
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        
        self.item.update(name: self.textFilmStock, order: self.textOrder)
        self.cancelAction()
    }
    
    func dirty() -> Bool {
        
        return !self.textFilmStock.isEmpty && self.textOrder.isInt &&
            ((self.textFilmStock != self.item.name) || (Int32(self.textOrder) != self.item.order))
    }
}

#if DEBUG
struct ItemEditView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemEditView(item: Item.preview() )
        }
    }
}
#endif
