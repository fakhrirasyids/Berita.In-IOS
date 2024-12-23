//
//  HomeRepository.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import BeritaInCore
import RxSwift
import Common

public class HomeRepository<
    RemoteDataSource: DataSource,
    Transformer: Mapper
>: Repository
where RemoteDataSource.Request == String,
      RemoteDataSource.Response == HomeNewsResponse,
      Transformer.Responses == [HomeArticleApi],
      Transformer.Models == [NewsModel] {

    public typealias Request = String
    public typealias Response = [NewsModel]

    private let remote: RemoteDataSource
    private let mapper: Transformer

    public init(remote: RemoteDataSource, mapper: Transformer) {
        self.remote = remote
        self.mapper = mapper
    }

    public func executeObservable(request: Request) -> Observable<Response> {
        return remote.executeObservable(request: request)
            .map { response in
                return self.mapper
                    .mapResponsesToModels(responses: response.articles)
            }
    }
}
