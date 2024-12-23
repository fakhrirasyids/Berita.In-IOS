//
//  HomeViewModel.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import RxSwift
import SwiftUI
import Home
import Common

class HomeViewModel: ObservableObject {
    private let homeUseCase: any HomeUseCase
    private let disposeBag = DisposeBag()

    @Published var selectedCategory: String = Params.business.category

    @Published var topHeadlines: [NewsModel] = []
    @Published var categoriesNews: [NewsModel] = []

    @Published var isLoadingHeadline: Bool = false
    @Published var isLoadingCategories: Bool = false

    @Published var errorMessageHeadline: String?
    @Published var errorMessageCategories: String?

    init(homeUseCase: any HomeUseCase) {
        self.homeUseCase = homeUseCase

        fetchTopHeadlines(category: Params.general.category)
        fetchNewsByCategories(category: selectedCategory)
    }

    func fetchTopHeadlines(category: String) {
        errorMessageHeadline = nil
        isLoadingHeadline = true
        homeUseCase.getNews(request: category)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] news in
                    self?.topHeadlines = news
                    self?.isLoadingHeadline = false
                },
                onError: { [weak self] error in
                    self?.errorMessageHeadline = error.localizedDescription
                    self?.isLoadingHeadline = false
                }
            )
            .disposed(by: disposeBag)
    }

    func fetchNewsByCategories(category: String) {
        errorMessageCategories = nil
        isLoadingCategories = true
        homeUseCase.getNews(request: category)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] news in
                    self?.categoriesNews = news
                    self?.isLoadingCategories = false
                },
                onError: { [weak self] error in
                    self?.errorMessageCategories = error.localizedDescription
                    self?.isLoadingCategories = false
                }
            )
            .disposed(by: disposeBag)
    }
}
