//
//  DetailView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Common
import Detail

struct DetailView: View {
    @StateObject var detailViewModel: DetailViewModel = DetailViewModel(
        detailAddUseCase: Detail.DetailInjection.instance.provideAddUseCase(),
        detailRemoveUseCase: Detail.DetailInjection.instance.provideRemoveUseCase(),
        detailCheckUseCase: Detail.DetailInjection.instance.provideCheckUseCase()
    )

    @Environment(\.presentationMode) var presentationMode
    let news: NewsModel

    var onFavoriteChange: (() -> Void)?

    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack(spacing: 16) {
                    ZStack(alignment: .bottom) {
                        if let imageUrl = news.urlToImage, let url = URL(string: imageUrl) {
                            WebImage(url: url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .clipped()
                                .overlay(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .foregroundColor(.gray)
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        if let publishedAt = news.publishedAt {
                            Text(publishedAt)
                                .font(.footnote)
                                .foregroundColor(.black)
                        }

                        if let title = news.title {
                            Text(title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .lineLimit(3)
                        }

                        if let author = news.author {
                            Text("By \(author)")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.8))
                        }
                    }
                    .padding(16)
                    .background(
                        BlurView(style: .systemUltraThinMaterialLight)
                            .cornerRadius(12)
                    )
                    .padding(.horizontal, 16)
                    .offset(y: -60)

                    if let description = news.description {
                        Text(description)
                            .font(.body)
                            .foregroundColor(.black.opacity(0.8))
                            .padding(.horizontal, 16)
                    }
                }
            }

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 36, height: 36)
                    .background(Color.gray.opacity(0.8))
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding(.leading, 16)
            .padding(.top, 46)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        toggleFavorite()
                    }
                    ) {
                        Image(systemName: detailViewModel.isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
                    }
                    .padding(.trailing, 16)
                    .padding(.bottom, 16)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
        .onAppear {
            detailViewModel.checkIsFavorite(news: news)
        }
    }
}

extension DetailView {
    func toggleFavorite() {
        if detailViewModel.isFavorite {
            detailViewModel.removeFavorite(news: self.news)
        } else {
            detailViewModel.addFavorite(news: self.news)
        }

        onFavoriteChange?()
    }
}

#Preview {
    DetailView(news: NewsModel(
        author: "BBC News",
        content: "A woman has been killed",
        description: "A woman believed to be in her 40s died from gun injuries on Saturday night.",
        urlToImage: "urlToImage",
        title: "Harlesden: Woman killed and two injured in shooting",
        url: "https://www.bbc.co.uk/news/articles/cj0rmjdnzndo",
        publishedAt: "28 Nov 2024"
    ))
}
