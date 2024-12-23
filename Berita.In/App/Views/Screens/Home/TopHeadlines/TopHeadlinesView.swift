//
//  TopHeadlinesView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import SwiftUI
import Common

struct TopHeadlinesView: View {
    let topHeadlines: [NewsModel]

    var body: some View {
        VStack {
            Text("top_headlines".toLocalized())
                .font(.system(size: 20, weight: .bold))
                .padding([.top], 16)

            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(topHeadlines, id: \.title) { news in
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
