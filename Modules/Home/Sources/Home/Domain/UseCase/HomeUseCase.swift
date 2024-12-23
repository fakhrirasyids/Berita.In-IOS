//
//  HomeUseCase.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public protocol HomeUseCase: UseCase
where Request == String, Response == [NewsModel] {
    func getNews(request: Request) -> Observable<Response>
}
