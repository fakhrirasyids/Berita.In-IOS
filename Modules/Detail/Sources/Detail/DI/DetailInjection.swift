//
//  DetailInjection.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import Swinject
import Common

@MainActor
public class DetailInjection {
    public static let instance = DetailInjection()

    let container = Container()

    public init() {
        let coreDataServices = CoreDataServices.instance

        let addLocal = DetailAddFavoriteLocalDataSource(coreDataServices: coreDataServices)
        let removeLocal = DetailRemoveFavoriteLocalDataSource(coreDataServices: coreDataServices)
        let checkLocal = DetailCheckFavoriteLocalDataSource(coreDataServices: coreDataServices)

        let addRepo = DetailAddRepository<DetailAddFavoriteLocalDataSource>(local: addLocal)
        let removeRepo = DetailRemoveRepository<DetailRemoveFavoriteLocalDataSource>(local: removeLocal)
        let checkRepo = DetailCheckRepository<DetailCheckFavoriteLocalDataSource>(local: checkLocal)

        let addUseCase = DetailAddInteractor(repository: addRepo)
        let removeUseCase = DetailRemoveInteractor(repository: removeRepo)
        let checkUseCase = DetailCheckInteractor(repository: checkRepo)

        container.register((any DetailAddUseCase).self) { _ in addUseCase }
        container.register((any DetailRemoveUseCase).self) { _ in removeUseCase }
        container.register((any DetailCheckUseCase).self) { _ in checkUseCase }
    }

    public func provideAddUseCase() -> any DetailAddUseCase {
        return container.resolve((any DetailAddUseCase).self)!
    }

    public func provideRemoveUseCase() -> any DetailRemoveUseCase {
        return container.resolve((any DetailRemoveUseCase).self)!
    }

    public func provideCheckUseCase() -> any DetailCheckUseCase {
        return container.resolve((any DetailCheckUseCase).self)!
    }
}
