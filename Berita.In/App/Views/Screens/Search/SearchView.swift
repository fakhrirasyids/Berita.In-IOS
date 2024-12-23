//
//  SearchView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import SwiftUI
import Common
import Searches

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel =
    SearchViewModel(
        searchUseCase: Searches.SearchInjection.instance.provideSearchUseCase()
    )

    var body: some View {
        VStack(alignment: .leading) {
            Text("search_news".toLocalized())
                .font(.system(size: 26, weight: .bold))
                .padding([.top, .leading], 16)

            TextField("search_here".toLocalized(), text: $searchViewModel.searchQuery, onCommit: {
                searchViewModel.fetchSearchedNews()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.horizontal, .bottom])

            if searchViewModel.isLoading {
                ProgressView("loading_news_search".toLocalized())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            } else if let errorMessage = searchViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(searchViewModel.searchedNews, id: \.title) { news in
                            NavigationLink(destination: DetailView(news: news)) {
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
    }
}

#Preview {
    SearchView()
}
