import SwiftUI

struct ItemListCell: View {
    
    var name: String
    var order: Int32
    var check: Bool
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(name)
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text(String(order))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            if self.check {
                Image(systemName: "checkmark")
            }
        }
    }
}

#if DEBUG
struct ItemListCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemListCell(name: "Item 0", order: 0, check: false)
    }
}
#endif
