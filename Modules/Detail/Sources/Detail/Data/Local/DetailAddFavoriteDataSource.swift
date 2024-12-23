//
//  DetailAddLocalDataSource.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common
import CoreData

public class DetailAddFavoriteLocalDataSource: DataSource {
    public typealias Request = NewsModel
    public typealias Response = Bool

    var coreDataServices: CoreDataServices

    init(coreDataServices: CoreDataServices) {
        self.coreDataServices = coreDataServices
    }

    public func executeCompletable(request: Request) -> Completable {
        return Completable.create { completable in
            let favorite = NewsEntity(context: self.coreDataServices.context)
            favorite.author = request.author
            favorite.title = request.title
            favorite.content = request.content
            favorite.desc = request.description
            favorite.url = request.url
            favorite.publishedAt = request.publishedAt
            favorite.urlToImage = request.urlToImage

            do {
                try self.coreDataServices.saveContext()
                completable(.completed)
            } catch {
                completable(.error(error))
            }
            return Disposables.create()
        }
    }
}
