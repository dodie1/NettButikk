import SwiftUI

struct ContentView: View {
    @StateObject var cart = Cart() // Create a cart state object to share between views
    
    // Define columns for the grid layout
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        TabView {
            // First tab: Products
            NavigationView {
                ScrollView {
                    // Create a LazyVGrid with the defined columns and spacing
                    LazyVGrid(columns: columns, spacing: 16) {
                        // Loop through the products
                        ForEach(products) { product in
                            // Create a NavigationLink for each product, leading to its ProductDetailView
                            NavigationLink(destination: ProductDetailView(product: product).environmentObject(cart)) {
                                // Display the product in a ProductItem view
                                ProductItem(product: product)
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle("Products")
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Products")
            }
            
            // Second tab: Cart
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .environmentObject(cart) // Pass the cart environment object to the CartView

            // Third tab: User Info
            UserInfoView()
                .tabItem {
                    Image(systemName: "person")
                    Text("User Info")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
