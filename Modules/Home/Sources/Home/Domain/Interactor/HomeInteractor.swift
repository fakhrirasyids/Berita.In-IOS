//
//  HomeInteractor.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public class HomeInteractor:
    Interactor<String, [NewsModel], HomeRepository<HomeHeadlinesRemoteDataSource, HomeTransformer>>,
    HomeUseCase {
    public override init(repository: HomeRepository<HomeHeadlinesRemoteDataSource, HomeTransformer>) {
        super.init(repository: repository)
    }

    public func getNews(request: Request) -> RxSwift.Observable<Response> {
        super.executeObservable(request: request)
    }
}
