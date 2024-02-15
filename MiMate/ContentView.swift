//
//  ContentView.swift
//  MiMate
//
//  Created by Leila on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return } // dont refetch data if have
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            users = try decoder.decode([User].self, from: data)
            
        } catch {
            print("Download failed")
        }
    }
}

#Preview {
    ContentView()
}
