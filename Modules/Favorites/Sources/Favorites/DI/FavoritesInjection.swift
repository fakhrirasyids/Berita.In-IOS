//
//  HomeInjection.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import Swinject
import Common

@MainActor
public class FavoritesInjection {
    public static let instance = FavoritesInjection()

    let container = Container()

    public init() {
        let coreDataServices = CoreDataServices.instance
        let local = FavoriteLocalDataSource(coreDataServices: coreDataServices)
        let transformer: FavoritesTransformer = FavoritesTransformer()
        let favoriteRepo =
        FavoritesRepository<FavoriteLocalDataSource, FavoritesTransformer>(local: local, mapper: transformer)
        let favoriteUseCase = FavoritesInteractor(repository: favoriteRepo)

        container.register((any FavoritesUseCase).self) { _ in favoriteUseCase }
    }

    public func provideFavoriteUseCase() -> any FavoritesUseCase {
        return container.resolve((any FavoritesUseCase).self)!
    }
}
