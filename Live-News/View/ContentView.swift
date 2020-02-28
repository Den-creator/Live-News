//
//  ContentView.swift
//  Live-News
//
//  Created by Ден on 28.02.2020.
//  Copyright © 2020 Ден. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 193.0/255, green: 7.0/255, blue: 23.0/255, alpha: 1.0)

        UINavigationBar.appearance().largeTitleTextAttributes = [
                   .foregroundColor: UIColor.white,
//                   .font : UIFont(name:"Helvetica", size: 40)!
        ]
                
    }
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(post.title)
                        .font(.system(size: 18))
                        .fontWeight(.medium)

                    }
                }
            }
            .navigationBarTitle("Live-News")
        
        }
        .onAppear {
            self.networkManager.fatchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
