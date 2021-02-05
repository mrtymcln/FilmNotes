import SwiftUI

struct AttributeListCell: View {
    
    var name: String
    var order: Int32
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(self.name)
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text(String(self.order))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}

#if DEBUG
struct AttributeListCell_Previews: PreviewProvider {
    static var previews: some View {
        AttributeListCell(name: "Attribute 0.0", order: 0)
    }
}
#endif
