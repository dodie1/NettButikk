import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cart.items) { cartItem in
                        HStack {
                            Text(cartItem.product.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Spacer()
                            Text("x\(cartItem.quantity)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("$\(cartItem.product.price * Double(cartItem.quantity), specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Button(action: {
                                cart.removeItem(cartItem)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    }
                }
                
                Text("Total: $\(cart.getTotalPrice(), specifier: "%.2f")")
                    .font(.title)
                    .padding(.vertical)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(Cart())
    }
}
