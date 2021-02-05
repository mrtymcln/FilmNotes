import SwiftUI

struct AddDeleteToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: AddDeleteToggleStyle.Configuration) -> some View {
        HStack {
            if configuration.isOn {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
                    .onTapGesture(perform: { configuration.isOn.toggle() } )
            } else {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .onTapGesture(perform: { configuration.isOn.toggle() } )
            }
            configuration.label
        }
    }
}
