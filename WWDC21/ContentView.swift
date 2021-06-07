//
//  ContentView.swift
//  WWDC21
//
//  Created by Bezhan Odinaev on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 12) {
                    NavigationLink(destination: UsersView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(Color(.secondarySystemBackground))
                                .frame(height: 120)
                            
                            VStack(spacing: 12) {
                                Image(systemName: "person")
                                    .font(.largeTitle)
                                
                                Text("Users")
                                    .font(Font.headline.bold())
                            }
                        }
                    }
                }.padding()
            }
            .navigationTitle("WWDC21")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
