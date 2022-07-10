//
//  FavoritesView.swift
//  Favorites
//
//  Created by Pavel on 9.07.22.
//

import SwiftUI
import Shared_Models

// MARK: - Favorites View
public struct FavoritesView: View {
    // MARK: Properties
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title, order: .reverse)])
    private var favoriteMovieSearch: FetchedResults<Movie>
    
    @State private var favoriteMovieSearchText = ""
    private var query: Binding<String> {
        Binding {
            favoriteMovieSearchText
        } set: { newValue in
            favoriteMovieSearchText = newValue
            favoriteMovieSearch.nsPredicate = newValue.isEmpty
            ? nil
            : NSPredicate(format: "title CONTAINS %@", newValue)
        }
    }
    
    // MARK: Public Initializer
    public init() {}
    
    // MARK: Body
    public var body: some View {
        NavigationView {
            List {
                ForEach(favoriteMovieSearch) { movieModel in
                    NavigationLink {
                        FavoritesDetailView(movieModel: movieModel)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: "\(Keys.baseImageURL)\(movieModel.posterPath ?? "")")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 80)
                            
                            Text(movieModel.title ?? "")
                        }
                    }

                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        CoreDataManager.shared.deleteFavoriteMovie(movie: favoriteMovieSearch[index])
                    }
                }
            } //: List
            .navigationTitle("Favorites")
        } //: NavigationView
        .searchable(text: query, prompt: "Search by title")
    }
}

// MARK: Favorites View Previews
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
