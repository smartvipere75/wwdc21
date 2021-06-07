//
//  UsersView.swift
//  WWDC21
//
//  Created by Bezhan Odinaev on 6/8/21.
//

import SwiftUI

struct UsersView: View {
    @StateObject var viewModel: UsersViewModel = UsersViewModel()
    
    var body: some View {
        List(viewModel.filteredUsers) { user in
            NavigationLink(destination: Text(user.name)) {
                Text(user.name)
            }
        }
        .overlay(viewModel.users.isEmpty ?
                 Text("Pull down to fetch users")
                    .font(.headline) : nil)
        .navigationTitle("Users")
        .refreshable {
            await viewModel.fetchUsers()
        }
        .searchable(text: $viewModel.search)
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
