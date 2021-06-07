//
//  UsersViewModel.swift
//  WWDC21
//
//  Created by Bezhan Odinaev on 6/8/21.
//

import SwiftUI

final class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var search: String = ""
    
    var filteredUsers: [User] {
        return search.isEmpty ? users : users.filter({ $0.name.lowercased().contains(search.lowercased()) })
    }
    
    func fetchUsers() async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            let decoded = try JSONDecoder().decode([User].self, from: data)
            self.users = decoded
        } catch {
            // TODO: Handle error
            print(error)
        }
    }
}
