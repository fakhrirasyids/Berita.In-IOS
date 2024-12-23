//
//  DetailAddRepository.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common

public class DetailAddRepository<
    LocalDataSource: DataSource
>: Repository
where DetailAddFavoriteLocalDataSource.Request == NewsModel,
      DetailAddFavoriteLocalDataSource.Response == Bool {

    public typealias Request = NewsModel
    public typealias Response = Bool

    private let local: DetailAddFavoriteLocalDataSource

    public init(local: DetailAddFavoriteLocalDataSource) {
        self.local = local
    }

    public func executeCompletable(request: Request) -> Completable {
        return local.executeCompletable(request: request)
    }
}
