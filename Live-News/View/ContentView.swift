//
//  ContentView.swift
//  Live-News
//
//  Created by Ден on 28.02.2020.
//  Copyright © 2020 Ден. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var networkManager = NetworkManager()
    
    var selectedCategory: String?
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    VStack{
                    Spacer(minLength: 10)
                        Text(post.title)
                        .font(.system(size: 18))
                        .fontWeight(.light)
                    Spacer(minLength: 10)
                    }
                }
                .navigationBarTitle(Text("\(self.selectedCategory!)"), displayMode: .inline)
            }
        }
        .onAppear {
            self.networkManager.getCategory(self.selectedCategory)
            self.networkManager.fatchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
