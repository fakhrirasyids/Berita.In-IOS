//
//  DetailCheckLocalDataSource.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common
import CoreData

public class DetailCheckFavoriteLocalDataSource: DataSource {
    public typealias Request = NewsModel
    public typealias Response = Bool

    var coreDataServices: CoreDataServices

    init(coreDataServices: CoreDataServices) {
        self.coreDataServices = coreDataServices
    }

    public func executeSingle(request: Request) -> Single<Response> {
        return Single.create { single in
            let fetchRequest: NSFetchRequest<NewsEntity> = NewsEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "title == %@", request.title ?? "")

            do {
                let count = try self.coreDataServices.context.count(for: fetchRequest)
                single(.success(count > 0))
            } catch {
                single(.failure(error))
            }
            return Disposables.create()
        }
    }
}
