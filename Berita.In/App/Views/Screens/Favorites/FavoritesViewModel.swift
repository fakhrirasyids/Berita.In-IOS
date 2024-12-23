//
//  FavoritesViewModel.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 17/12/24.
//

import Foundation
import RxSwift
import Common
import Favorites

class FavoritesViewModel: ObservableObject {
    @Published var favoritesList: [NewsModel] = []

    private let favoritesUseCase: any FavoritesUseCase
    private var disposeBag = DisposeBag()

    init(favoritesUseCase: any FavoritesUseCase) {
        self.favoritesUseCase = favoritesUseCase
    }

    func getAllFavorites() {
        favoritesUseCase.getNews(request: true)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] favorites in
                self?.favoritesList = favorites
            }, onError: { error in
                print("Error fetching favorites: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}
