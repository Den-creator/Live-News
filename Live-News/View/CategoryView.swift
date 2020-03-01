//
//  TopicsView.swift
//  Live-News
//
//  Created by Ден on 29.02.2020.
//  Copyright © 2020 Ден. All rights reserved.
//

import SwiftUI

struct Category: Identifiable {
    let id: Int
    let category: String
}


struct CategoryView: View {
    

    var categoryList = [
        Category(id: 0, category: "General"),
        Category(id: 1, category: "Business"),
        Category(id: 2, category: "Entertainment"),
        Category(id: 3, category: "Health"),
        Category(id: 4, category: "Science"),
        Category(id: 5, category: "Sports"),
        Category(id: 6, category: "Technology")
    ]
    
      init() {
          UINavigationBar.appearance().backgroundColor = UIColor(red: 193.0/255, green: 7.0/255, blue: 23.0/255, alpha: 1.0)

          UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
      }
    
    
    var body: some View {
        NavigationView{
            List(categoryList) { item in
                NavigationLink(destination: ContentView(selectedCategory: item.category)){
                    VStack{
                    Spacer(minLength: 10)
                    Text(item.category)
                    .font(.system(size: 32))
                    Spacer(minLength: 10)
                }
                }
            }
                .navigationBarTitle("Live-News")
        }

    }
    
}


struct TopicsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

