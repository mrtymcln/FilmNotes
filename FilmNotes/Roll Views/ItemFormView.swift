import SwiftUI

struct ItemFormView: View {

    @Binding var textFilmStock: String
    @Binding var textOrder: String

    @Binding var editMode: EditMode
    
    var body: some View {
        
        Section(header: Text("roll_item".uppercased())) {
            
            VStack {
                HStack {
                    Text("Film stock").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("Kodak Portra", text: self.$textFilmStock)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    HStack {
                        Text(self.textFilmStock)
                        Spacer()
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Order").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("", text: self.$textOrder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    HStack {
                        Text(self.textOrder)
                        Spacer()
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ItemFormView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                ItemFormView(textFilmStock: .constant(""),
                             textOrder: .constant(""),
                             editMode: .constant(.active) )
            }
        }
    }
}
#endif
