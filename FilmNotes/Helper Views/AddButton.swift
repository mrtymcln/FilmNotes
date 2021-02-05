import SwiftUI
struct AddButton<Destination : View>: View {
    
    var destination:  Destination
    
    var body: some View {
        NavigationLink(destination: self.destination) { Image(systemName: "plus.circle") }
    }
}

#if DEBUG
struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(destination: EmptyView())
    }
}
#endif
