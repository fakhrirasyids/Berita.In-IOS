//
//  HomeInjection.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import Swinject

@MainActor
public class HomeInjection {
    public static let instance = HomeInjection()

    let container = Container()

    public init() {
        let remote = HomeHeadlinesRemoteDataSource()
        let transformer: HomeTransformer = HomeTransformer()
        let homeRepo =
        HomeRepository<HomeHeadlinesRemoteDataSource, HomeTransformer>(remote: remote, mapper: transformer)
        let homeUseCase = HomeInteractor(repository: homeRepo)

        container.register((any HomeUseCase).self) { _ in homeUseCase }
    }

    public func provideHomeUseCase() -> any HomeUseCase {
        return container.resolve((any HomeUseCase).self)!
    }
}
