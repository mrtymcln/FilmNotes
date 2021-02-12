import SwiftUI

struct AttributeFormView: View {
    
    @Binding var textName: String
    @Binding var textOrder: String
    
    var body: some View {
        
        Section(header: Text("")) {
            VStack {
                HStack {
                    Text("Order")
                        .foregroundColor(.gray)
                    Spacer()
                }
                TextField("", text: self.$textOrder)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack {
                HStack {
                    Text("Date taken").foregroundColor(.gray)
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("") })
                }
            }
        }
        
        Section(header: Text("")) {
            VStack {
                HStack {
                    Text("Aperture")
                        .foregroundColor(.gray)
                    Spacer()
                }
                TextField("f/", text: self.$textName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack {
                HStack {
                    Text("Shutter speed")
                        .foregroundColor(.gray)
                    Spacer()
                }
                TextField("", text: self.$textName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack {
                HStack {
                    Text("Compensation")
                        .foregroundColor(.gray)
                    Spacer()
                }
                TextField("", text: self.$textName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack {
                HStack {
                    Text("Notes")
                        .foregroundColor(.gray)
                    Spacer()
                }
                TextField("", text: self.$textName)
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
