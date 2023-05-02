import SwiftUI

struct ProductItem: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .shadow(radius: 5)
            Text(product.title)
                .font(.headline)
                .foregroundColor(.primary)
            Text("$\(product.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(product: products[0])
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
    }
}
