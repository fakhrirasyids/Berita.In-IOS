//
//  DetailRemoveLocalDataSource.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common
import CoreData

public class DetailRemoveFavoriteLocalDataSource: DataSource {
    public typealias Request = NewsModel
    public typealias Response = Bool

    var coreDataServices: CoreDataServices

    init(coreDataServices: CoreDataServices) {
        self.coreDataServices = coreDataServices
    }

    public func executeCompletable(request: Request) -> Completable {
        return Completable.create { completable in
            let fetchRequest: NSFetchRequest<NewsEntity> = NewsEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "title == %@", request.title ?? "")

            do {
                let items = try self.coreDataServices.context.fetch(fetchRequest)
                items.forEach { self.coreDataServices.context.delete($0) }
                try self.coreDataServices.saveContext()
                completable(.completed)
            } catch {
                completable(.error(error))
            }
            return Disposables.create()
        }
    }
}
