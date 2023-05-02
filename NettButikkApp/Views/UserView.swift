import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(user.name)")
            Text("Email: \(user.email)")
            Text("Address: \(user.address)")
            Text("Phone: \(user.phone)")
        }
        .padding()
        .navigationBarTitle("User Details", displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(name: "John Doe", email: "john.doe@example.com", address: "123 Main St, New York, NY", phone: "+1 (234) 567-8901", picture: ""))
    }
}
