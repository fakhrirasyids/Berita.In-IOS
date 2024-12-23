//
//  FavoritesRepository.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import BeritaInCore
import RxSwift
import Common

public class FavoritesRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper
>: Repository
where FavoriteLocalDataSource.Request == Bool,
      FavoriteLocalDataSource.Response == [NewsEntity],
      Transformer.Responses == [NewsEntity],
      Transformer.Models == [NewsModel] {

    public typealias Request = Bool
    public typealias Response = [NewsModel]

    private let local: FavoriteLocalDataSource
    private let mapper: Transformer

    public init(local: FavoriteLocalDataSource, mapper: Transformer) {
        self.local = local
        self.mapper = mapper
    }

    public func executeObservable(request: Request) -> Observable<Response> {
        return local.executeSingle(request: request).asObservable()
            .map { response in
                return self.mapper
                    .mapResponsesToModels(responses: response)
            }
    }
}
