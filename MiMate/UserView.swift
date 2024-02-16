//
//  UserView.swift
//  MiMate
//
//  Created by Leila on 2/15/24.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        List {
            Section("About") {
                Text(user.about)
            }
            Section("Contact details") {
                Text("Address: \(user.address)")
                Text("Company: \(user.company)")
            }
            Section("Friends") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .listStyle(.grouped)
        .navigationTitle(user.name)
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserView(user: .example)
}
