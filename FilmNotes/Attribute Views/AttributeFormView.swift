import SwiftUI

struct AttributeFormView: View {
    
    @Binding var textName: String
    @Binding var textOrder: String
    
    var body: some View {
        
            Section(header: Text("exposure_attribute".uppercased())) {
                
                VStack {
                    HStack {
                        Text("Exposure description")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    TextField("Dog", text: self.$textName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                VStack {
                    HStack {
                        Text("Order")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    TextField("", text: self.$textOrder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
    }
}

#if DEBUG
struct AttributeFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                AttributeFormView(textName: .constant(""), textOrder: .constant(""))
           }
        }
    }
}
#endif
