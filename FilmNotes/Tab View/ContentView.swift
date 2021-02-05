import SwiftUI

struct ContentView: View {
    @State private var isWhatsNewViewShowing = true
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection){
            ItemListView()
                .tabItem {
                    VStack {
                        Image(systemName: "camera.fill")
                        Text("Camera")
                    }
            }
            .tag(1)
            HStack {
                ItemListView()
                ItemListView()
            }
            .tabItem {
                VStack {
                    Image(systemName: "ant.fill")
                    Text("Debug")
                }
            }
            .tag(2)
            AttributesGroupedView()
                .tabItem {
                    VStack {
                        Image(systemName: "cube.box.fill")
                        Text("Shoe Box")
                    }
            }
            .tag(3)
            ItemSelectionView()
                .tabItem {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Selections")
                    }
            }
            .tag(4)
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(5)
        }
        .sheet(isPresented: $isWhatsNewViewShowing) {
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
