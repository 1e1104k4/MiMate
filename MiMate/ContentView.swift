//
//  ContentView.swift
//  MiMate
//
//  Created by Leila on 2/15/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) private var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .blue : .gray)
                            .frame(width: 15)
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("MiMate")
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
            }
            .task {
                await fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return } // dont refetch data if have
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let downloadedUsers = try decoder.decode([User].self, from: data)
            
            for user in downloadedUsers {
                modelContext.insert(user)
            }
        } catch {
            print("Download failed")
        }
    }
}

#Preview {
    ContentView()
}
