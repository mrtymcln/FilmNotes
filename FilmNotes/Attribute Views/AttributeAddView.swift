import SwiftUI

struct AttributeAddView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var item: Item
    
    @State var textExposureDescription: String = ""
    @State var textOrder: String = ""
    
    var body: some View {
        
        Form {
            AttributeFormView(textName: self.$textExposureDescription, textOrder: self.$textOrder)
        }
            .onAppear(perform: { self.onAppear() })
            .navigationBarTitle(Text("Add Exposure"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action:{ self.saveAction() }) { Text("Save") }.disabled(!self.dirty()) )
    }
    
    func onAppear() {
        let order = Attribute.nextOrderFor(item: item)
        self.textExposureDescription = "Attribute \(item.order).\(order)"
        self.textOrder = String(order)
    }
    
    func cancelAction() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        _ = Attribute.createAttributeFor(item: item, name: self.textExposureDescription, order: Int(self.textOrder))
        self.cancelAction()
    }
    
    func dirty() -> Bool {
        return !self.textExposureDescription.isEmpty && self.textOrder.isInt
    }
}

#if DEBUG
struct AttributeAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AttributeAddView(item: Item.allInOrder().first!)
        }
    }
}
#endif
