import SwiftUI

struct AttributeFormView: View {
    
    @Binding var textName: String
    @Binding var textOrder: String
    
    var body: some View {
        
            Section(header: Text("EXPOSURE_ATTRIBUTE")) {
                
                VStack {
                    HStack {
                        Text("Description")
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
