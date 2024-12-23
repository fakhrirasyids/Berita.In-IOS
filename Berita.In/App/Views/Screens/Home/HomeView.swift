//
//  HomeView.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import SwiftUI
import Home
import Common

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel =
    HomeViewModel(
        homeUseCase: Home.HomeInjection.instance.provideHomeUseCase()
    )

    let categories: [Params] = [
        .business,
        .entertainment,
        .health,
        .science,
        .sports,
        .technology
    ]

    var body: some View {
        VStack(alignment: .leading) {
            topHeadlineSection

            if homeViewModel.isLoadingHeadline {
                loadingView("loading_headlines".toLocalized(), maxHeight: 250)
            } else if let errorMessage = homeViewModel.errorMessageHeadline {
                errorView(errorMessage)
            } else {
                headlineNewsSection
            }

            categoryButton(selectedCategory: $homeViewModel.selectedCategory)

            if homeViewModel.isLoadingCategories {
                loadingView(String(format: "loading_news".toLocalized(), homeViewModel.selectedCategory.toLocalized()))
            } else if let errorMessage = homeViewModel.errorMessageCategories {
                errorView(errorMessage)
            } else {
                categoriesNewsSection
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

private extension HomeView {
    var topHeadlineSection: some View {
        HStack {
            Text("top_headlines".toLocalized())
                .font(.system(size: 26, weight: .bold))
                .padding([.top, .leading], 16)

            Spacer()

            if !homeViewModel.isLoadingHeadline && homeViewModel.errorMessageHeadline == nil {
                NavigationLink(destination: TopHeadlinesView(topHeadlines: homeViewModel.topHeadlines)) {
                    Text("see_all".toLocalized())
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.blue)
                }
                .padding([.trailing, .top], 16)
            }
        }
    }

    var headlineNewsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(homeViewModel.topHeadlines.prefix(3), id: \.title) { news in
                    NavigationLink(destination: DetailView(news: news)) {
                        HeadlineNewsItem(news: news)
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(maxHeight: 250)
        }
    }

    var categoriesNewsSection: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(homeViewModel.categoriesNews, id: \.title) { news in
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

    func loadingView(_ message: String, maxHeight: CGFloat = .infinity) -> some View {
        ProgressView(message)
            .frame(maxWidth: .infinity, maxHeight: maxHeight)
    }

    func errorView(_ message: String) -> some View {
        Text(message)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension HomeView {
    func categoryButton(selectedCategory: Binding<String>) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(categories, id: \.self) { category in
                    categoryButton(selectedCategory: selectedCategory, category: category)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
        }
    }

    private func categoryButton(selectedCategory: Binding<String>, category: Params) -> some View {
        Button(action: {
            if selectedCategory.wrappedValue != category.category {
                selectedCategory.wrappedValue = category.category
                homeViewModel.fetchNewsByCategories(category: selectedCategory.wrappedValue)
            }
        }) {
            Text(category.category.toLocalized())
                .font(.system(size: 14, weight: .regular))
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    selectedCategory.wrappedValue == category.category ? Color.red : Color.white
                )
                .foregroundColor(
                    selectedCategory.wrappedValue == category.category ? .white : .black
                )
                .cornerRadius(24)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(
                            selectedCategory.wrappedValue == category.category
                            ? Color.clear : Color.gray, lineWidth: 0.1
                        )
                )
        }
        .disabled(selectedCategory.wrappedValue == category.category)
    }
}

#Preview {
    HomeView()
}
