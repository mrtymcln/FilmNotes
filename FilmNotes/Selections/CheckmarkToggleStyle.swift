import SwiftUI

struct CheckmarkToggleStyle: ToggleStyle {
    
    public func makeBody(configuration: AddDeleteToggleStyle.Configuration) -> some View {
        HStack {
            if configuration.isOn {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
                    .onTapGesture(perform: { configuration.isOn.toggle() } )
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
                    .onTapGesture(perform: { configuration.isOn.toggle() } )
            }
            configuration.label
        }
    }
}
