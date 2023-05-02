import SwiftUI

struct UserInfoView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Name: Supritha Gugale")
                Text("Email: supritha.gugale@example.com")
                Text("Phone: 8737152273")
                Text("Address: 2058 Bannerghatta Rd, Dibrugarh, Chhattisgarh, India")
            }
            .padding()
            .navigationTitle("User Information")
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
