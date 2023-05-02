import Foundation

class Cart: ObservableObject {
    @Published var items: [CartItem] = []
    
    func addItem(product: Product, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(product: product, quantity: quantity))
        }
    }
    
    func removeItem(_ cartItem: CartItem) {
        if let index = items.firstIndex(where: { $0.product.id == cartItem.product.id }) {
            items.remove(at: index)
        }
    }
    
    func getTotalPrice() -> Double {
        return items.reduce(0) { $0 + $1.product.price * Double($1.quantity) }
    }
}

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
