//
//  DetailRemoveRepository.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common

public class DetailRemoveRepository<
    LocalDataSource: DataSource
>: Repository
where DetailRemoveFavoriteLocalDataSource.Request == NewsModel,
      DetailRemoveFavoriteLocalDataSource.Response == Bool {

    public typealias Request = NewsModel
    public typealias Response = Bool

    private let local: DetailRemoveFavoriteLocalDataSource

    public init(local: DetailRemoveFavoriteLocalDataSource) {
        self.local = local
    }

    public func executeCompletable(request: Request) -> Completable {
        return local.executeCompletable(request: request)
    }
}
