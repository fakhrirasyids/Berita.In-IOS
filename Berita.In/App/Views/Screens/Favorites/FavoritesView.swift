//
//  FavoritesView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import SwiftUI
import Favorites

struct FavoritesView: View {
    @StateObject var favoritesViewModel: FavoritesViewModel =
    FavoritesViewModel(
        favoritesUseCase: Favorites.FavoritesInjection.instance.provideFavoriteUseCase()
    )

    var body: some View {
        VStack(alignment: .leading) {
            Text("favorites".toLocalized())
                .font(.system(size: 26, weight: .bold))
                .padding([.top, .leading], 16)

            if favoritesViewModel.favoritesList.isEmpty {
                VStack {
                    Image(systemName: "face.dashed")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding(.bottom, 16)
                    Text("empty_favorite".toLocalized())
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(favoritesViewModel.favoritesList, id: \.title) { news in
                            NavigationLink(destination: DetailView(news: news) {
                                favoritesViewModel.getAllFavorites()
                            }) {
                                NewsItem(news: news)
                                    .padding(.top, 24)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .onAppear {
            favoritesViewModel.getAllFavorites()
        }
    }
}

#Preview {
    FavoritesView()
}
