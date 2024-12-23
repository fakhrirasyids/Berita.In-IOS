//
//  FavoriteLocalDataSource.swift
//  Detail
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import BeritaInCore
import RxSwift
import Common
import CoreData

public class FavoriteLocalDataSource: DataSource {
    public typealias Request = Bool
    public typealias Response = [NewsEntity]

    var coreDataServices: CoreDataServices

    init(coreDataServices: CoreDataServices) {
        self.coreDataServices = coreDataServices
    }

    public func executeSingle(request: Request) -> Single<Response> {
        return Single.create { single in
            let fetchRequest: NSFetchRequest<NewsEntity> = NewsEntity.fetchRequest()

            do {
                let entities = try self.coreDataServices.context.fetch(fetchRequest)
                single(.success(entities))
            } catch {
                single(.failure(error))
            }
            return Disposables.create()
        }
    }
}
