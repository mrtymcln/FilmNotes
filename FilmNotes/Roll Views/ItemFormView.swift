import SwiftUI

struct ItemFormView: View {
    
    @Binding var textFilmStock: String
    @Binding var textOrder: String
    
    @Binding var editMode: EditMode
    
    var body: some View {
        
        Section(header: Text("")) {
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
            
            VStack {
                HStack {
                    Text("Date loaded").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("") })
                }
            }
        }
        
        Section(header: Text("")) {
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
                    Text("Process").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("")) {
                        Text("Colour negative").tag(1)
                        Text("Colour positive").tag(2)
                        Text("Black-and-white").tag(3)
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Box speed").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("400", text: self.$textFilmStock)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                } else {
                    HStack {
                        Text(self.textFilmStock)
                        Spacer()
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Exposure count").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("36", text: self.$textFilmStock)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                } else {
                    HStack {
                        Text(self.textFilmStock)
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
