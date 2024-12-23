//
//  SearchInteractor.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public class SearchInteractor:
    Interactor<String, [NewsModel], SearchRepository<SearchRemoteDataSource, SearchTransformer>>,
    SearchUseCase {
    public override init(repository: SearchRepository<SearchRemoteDataSource, SearchTransformer>) {
        super.init(repository: repository)
    }

    public func getSearchedNews(request: Request) -> RxSwift.Observable<Response> {
        super.executeObservable(request: request)
    }
}
