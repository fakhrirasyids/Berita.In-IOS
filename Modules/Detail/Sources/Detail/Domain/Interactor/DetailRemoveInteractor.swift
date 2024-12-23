//
//  DetailRemoveInteractor.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public class DetailRemoveInteractor:
    Interactor<NewsModel, Bool, DetailRemoveRepository<DetailRemoveFavoriteLocalDataSource>>,
    DetailRemoveUseCase {
    public override init(repository: DetailRemoveRepository<DetailRemoveFavoriteLocalDataSource>) {
        super.init(repository: repository)
    }

    public func removeFavorite(news: Request) -> Completable {
        return super.executeCompletable(request: news)
    }
}
