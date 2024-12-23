//
//  SearchViewModel.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import Foundation
import RxSwift
import Common
import Searches

class SearchViewModel: ObservableObject {
    private let searchUseCase: any SearchUseCase
    private let disposeBag = DisposeBag()

    @Published var searchQuery: String = ""

    @Published var searchedNews: [NewsModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    init(searchUseCase: any SearchUseCase) {
        self.searchUseCase = searchUseCase
    }

    func fetchSearchedNews() {
        errorMessage = nil
        isLoading = true
        searchUseCase.getSearchedNews(request: self.searchQuery)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] news in
                    self?.searchedNews = news
                    self?.isLoading = false
                },
                onError: { [weak self] error in
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                }
            )
            .disposed(by: disposeBag)
    }
}
