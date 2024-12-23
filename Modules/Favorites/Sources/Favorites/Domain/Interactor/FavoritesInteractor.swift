//
//  FavoritesInteractor.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public class FavoritesInteractor:
    Interactor<Bool, [NewsModel], FavoritesRepository<FavoriteLocalDataSource, FavoritesTransformer>>,
    FavoritesUseCase {
    public override init(repository: FavoritesRepository<FavoriteLocalDataSource, FavoritesTransformer>) {
        super.init(repository: repository)
    }

    public func getNews(request: Request) -> RxSwift.Observable<Response> {
        super.executeObservable(request: request)
    }
}
