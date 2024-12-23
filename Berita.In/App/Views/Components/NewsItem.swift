//
//  NewsItem.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Common

struct NewsItem: View {
    var news: NewsModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if let imageUrl = news.urlToImage, let url = URL(string: imageUrl) {
                WebImage(url: url)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(8)
                    .clipped()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.9), Color.clear]),
                                       startPoint: .bottom,
                                       endPoint: .top)
                        .cornerRadius(8)
                    )
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: 150)
                    .foregroundColor(.gray)
            }

            VStack(alignment: .leading) {
                if let title = news.title {
                    Text(title)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .lineLimit(3)
                        .padding([.leading, .bottom], 8)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                HStack {
                    if let author = news.author {
                        Text(author)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding([.leading], 8)
                    }

                    if let publishedAt = news.publishedAt {
                        Text(publishedAt)
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .padding(8)
        }
        .cornerRadius(8)
        .frame(height: 100)
        .padding(8)
    }
}

#Preview {
    NewsItem(news: NewsModel(
        author: "BBC News",
        content: "A woman has been killed",
        description: "A woman believed to be in her 40s died from gun injuries on Saturday night.",
        urlToImage: "urlToImage",
        title: "Harlesden: Woman killed and two injured in shooting",
        url: "https://www.bbc.co.uk/news/articles/cj0rmjdnzndo",
        publishedAt: "28 Nov 2024"
    ))
}
