//
//  DetailCheckInteractor.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public class DetailCheckInteractor:
    Interactor<NewsModel, Bool, DetailCheckRepository<DetailCheckFavoriteLocalDataSource>>,
    DetailCheckUseCase {
    public override init(repository: DetailCheckRepository<DetailCheckFavoriteLocalDataSource>) {
        super.init(repository: repository)
    }

    public func isFavorite(news: Request) -> RxSwift.Observable<Response> {
        return super.executeObservable(request: news)
    }
}
