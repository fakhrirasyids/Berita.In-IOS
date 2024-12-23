//
//  DetailCheckRepository.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common

public class DetailCheckRepository<
    LocalDataSource: DataSource
>: Repository
where DetailCheckFavoriteLocalDataSource.Request == NewsModel,
      DetailCheckFavoriteLocalDataSource.Response == Bool {

    public typealias Request = NewsModel
    public typealias Response = Bool

    private let local: DetailCheckFavoriteLocalDataSource

    public init(local: DetailCheckFavoriteLocalDataSource) {
        self.local = local
    }

    public func executeObservable(request: Request) -> Observable<Response> {
        return local.executeSingle(request: request).asObservable()
    }
}
