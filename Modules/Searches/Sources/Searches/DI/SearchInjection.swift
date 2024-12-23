//
//  SearchInjection.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import Swinject

@MainActor
public class SearchInjection {
    public static let instance = SearchInjection()

    let container = Container()

    public init() {
        let remote = SearchRemoteDataSource()
        let transformer: SearchTransformer = SearchTransformer()
        let searchRepo =
        SearchRepository<SearchRemoteDataSource, SearchTransformer>(remote: remote, mapper: transformer)
        let searchUseCase = SearchInteractor(repository: searchRepo)

        container.register((any SearchUseCase).self) { _ in searchUseCase }
    }

    public func provideSearchUseCase() -> any SearchUseCase {
        return container.resolve((any SearchUseCase).self)!
    }
}
