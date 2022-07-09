//
//  FavoritesDetailView.swift
//  Favorites
//
//  Created by Pavel on 9.07.22.
//

import SwiftUI

struct FavoritesDetailView: View {
    @State var array: [Int] = []
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    FavoritesDetailView()
                } label: {
                    HStack {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Text("Favorite Movie")
                            .font(.system(size: 18))
                    }
                }

            }
        }
    }
}

struct FavoritesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
