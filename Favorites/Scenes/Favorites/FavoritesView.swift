//
//  FavoritesView.swift
//  Favorites
//
//  Created by Pavel on 9.07.22.
//

import SwiftUI

// MARK: - Favorites View
public struct FavoritesView: View {
    // MARK: Properties
    
    // MARK: Public Initializer
    public init() {}
    
    // MARK: Body
    public var body: some View {
//        NavigationView {
            Image(systemName: "house")
            
            Spacer()
            
            Text("Movie Description")
        }
//        .navigationTitle("Favorite Movies")
//    }
}

// MARK: Favorites View Previews
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
