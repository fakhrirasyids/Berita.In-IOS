//
//  SearchRepository.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import BeritaInCore
import RxSwift
import Common

open class SearchRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper
>: Repository
where RemoteDataSource.Request == String,
      RemoteDataSource.Response == SearchNewsResponse,
      Transformer.Responses == [SearchArticleApi],
      Transformer.Models == [NewsModel] {

    public typealias Request = String
    public typealias Response = [NewsModel]

    private let remote: RemoteDataSource
    private let mapper: Transformer

    public init(remote: RemoteDataSource, mapper: Transformer) {
        self.remote = remote
        self.mapper = mapper
    }

    open func executeObservable(request: Request) -> Observable<Response> {
        return remote.executeObservable(request: request)
            .map { response in
                return self.mapper
                    .mapResponsesToModels(responses: response.articles)
            }
    }
}
