import SwiftUI

// Define the ProductDetailView struct which conforms to the View protocol
struct ProductDetailView: View {
    var product: Product
    
    // An EnvironmentObject to access the shared Cart instance
    @EnvironmentObject var cart: Cart
    // A State property to keep track of the selected quantity
    @State private var quantity: Int = 1
    
    // Define the body property which contains the view hierarchy
    var body: some View {
        VStack(alignment: .leading) {
            // Display the product image
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
            
            // Display the product title
            Text(product.title)
                .font(.title)
                .padding(.bottom)
            
            // Display the product description
            Text(product.description)
                .font(.body)
                .padding(.bottom)
            
            // Display the product price
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)

            // Add a Stepper to select the quantity
            Stepper(value: $quantity, in: 1...10) {
                Text("Quantity: \(quantity)")
                    .font(.subheadline)
            }
            .padding()

            // Add a Button to add the product to the cart with the selected quantity
            Button(action: {
                cart.addItem(product: product, quantity: quantity)
            }) {
                Text("Add to Cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .padding()
    }
}

// PreviewProvider for the ProductDetailView
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: products[0])
            .environmentObject(Cart())
    }
}
