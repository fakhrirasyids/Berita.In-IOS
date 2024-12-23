//
//  SearchUseCase.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public protocol SearchUseCase: UseCase
where Request == String, Response == [NewsModel] {
    func getSearchedNews(request: Request) -> Observable<Response>
}
