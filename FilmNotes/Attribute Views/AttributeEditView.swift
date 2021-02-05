import SwiftUI

struct AttributeEditView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var attribute: Attribute
    
    @State var textExposureDescription: String = ""
    @State var textOrder: String = ""
    
    var body: some View {
        
        Form {
            AttributeFormView(textName: self.$textExposureDescription, textOrder: self.$textOrder)
        }
        .onAppear(perform: { self.onAppear() })
        .navigationBarTitle(Text("Edit Exposure"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action:{ self.saveAction() }) { Text("Save") }.disabled(!self.dirty()) )
    }
    
    func onAppear() {
        
        self.textExposureDescription = self.attribute.name
        self.textOrder = String(self.attribute.order)
    }
    
    func cancelAction() {
        
        self.textExposureDescription = ""
        self.textOrder = ""
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func saveAction() {
        
        self.attribute.update(name: self.textExposureDescription, order: self.textOrder)
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func dirty() -> Bool {
        
        return !self.textExposureDescription.isEmpty && self.textOrder.isInt &&
            ((self.textExposureDescription != self.attribute.name) || (Int32(self.textOrder) != self.attribute.order))
    }
}

#if DEBUG
struct AttributeEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AttributeEditView(attribute: Attribute.preview() )
        }
    }
}
#endif
