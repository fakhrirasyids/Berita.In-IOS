//
//  DetailAddInteractor.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public class DetailAddInteractor:
    Interactor<NewsModel, Bool, DetailAddRepository<DetailAddFavoriteLocalDataSource>>,
    DetailAddUseCase {
    public override init(repository: DetailAddRepository<DetailAddFavoriteLocalDataSource>) {
        super.init(repository: repository)
    }

    public func addFavorite(news: Request) -> Completable {
        return super.executeCompletable(request: news)
    }
}
