import SwiftUI

extension String {
    
    var isInt: Bool {
        return Int(self) != nil
    }
}

struct ItemAddView : View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var textFilmStock: String = ""
    @State var textOrder: String = ""
    
    var body: some View {
        
        Form {
            ItemFormView(textFilmStock: self.$textFilmStock,
                         textOrder: self.$textOrder,
                         editMode: .constant(.active))
        }
        .onAppear(perform: { self.onAppear() })
        .navigationBarTitle(Text("Add Roll"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action:{ self.saveAction() }) { Text("Save") }.disabled(!self.dirty()) )
    }
    
    func onAppear() {
        let order = Item.nextOrder()
        self.textFilmStock = "Item \(order)"
        self.textOrder = String(order)
    }
    
    func cancelAction() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        _ = Item.createItem(name: self.textFilmStock, order: Int(self.textOrder))
        self.cancelAction()
    }
    
    func dirty() -> Bool {
        return !self.textFilmStock.isEmpty && self.textOrder.isInt
    }
}

#if DEBUG
struct ItemAddView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemAddView()
        }
    }
}
#endif
