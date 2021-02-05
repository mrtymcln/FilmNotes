import SwiftUI

struct WhatsNewView: View {
    @Binding var isWhatsNewShowing: Bool
    var body: some View {
        VStack() {
                Spacer()
                Text("What's New\nin Film Notes")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                HStack {
                    Image(systemName: "camera.fill")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading) {
                        Text("Load a Roll")
                            .bold()
                        Text("Film stock, box speed, colour or black-and-white.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(width:240)
                }
                
                HStack {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading) {
                        Text("Take an Exposure")
                            .bold()
                        Text("Description, date and time, aperture and shutter speed.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(width:240)
                }
                .padding()
                
                HStack {
                    Image(systemName: "icloud.fill")
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment: .leading) {
                        Text("iCloud support")
                            .bold()
                        Text("Sync between your iPhone, iPad and Mac.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(width:240)
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        isWhatsNewShowing.toggle()
                    }) {
                        Text("Continue")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 65)
                            .background(Color.blue)
                            .cornerRadius(9)
                    }
                }
                .padding(.bottom, 50)
            }
            .padding([.top, .leading, .bottom])
            
        }
    }

struct WhatsNewView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewView(isWhatsNewShowing: Binding.constant(true))
            
    }
}
