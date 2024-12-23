//
//  DetailViewModel.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 16/12/24.
//

import Foundation
import RxSwift
import Common
import Detail

class DetailViewModel: ObservableObject {
    @Published var isFavorite: Bool = false

    private let detailAddUseCase: any DetailAddUseCase
    private let detailRemoveUseCase: any DetailRemoveUseCase
    private let detailCheckUseCase: any DetailCheckUseCase

    private var disposeBag = DisposeBag()

    init(
        detailAddUseCase: any DetailAddUseCase,
        detailRemoveUseCase: any DetailRemoveUseCase,
        detailCheckUseCase: any DetailCheckUseCase
    ) {
        self.detailAddUseCase = detailAddUseCase
        self.detailRemoveUseCase = detailRemoveUseCase
        self.detailCheckUseCase = detailCheckUseCase
    }

    func checkIsFavorite(news: NewsModel) {
        detailCheckUseCase.isFavorite(news: news)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] isFavorite in
                self?.isFavorite = isFavorite
            }, onError: { error in
                print("Error checking favorite status: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }

    func addFavorite(news: NewsModel) {
        detailAddUseCase.addFavorite(news: news)
            .observe(on: MainScheduler.instance)
            .andThen(Observable.just(true))
            .subscribe(onNext: { [weak self] isFavorite in
                self?.isFavorite = isFavorite
            }, onError: { error in
                print("Error adding to favorites: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }

    func removeFavorite(news: NewsModel) {
        detailRemoveUseCase.removeFavorite(news: news)
            .observe(on: MainScheduler.instance)
            .andThen(Observable.just(false))
            .subscribe(onNext: { [weak self] isFavorite in
                self?.isFavorite = isFavorite
            }, onError: { error in
                print("Error removing from favorites: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}
