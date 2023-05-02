import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let address: String
    let phone: String
    let picture: String
}
