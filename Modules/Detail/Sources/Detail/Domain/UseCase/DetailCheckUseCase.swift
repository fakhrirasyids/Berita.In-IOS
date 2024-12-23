//
//  DetailCheckUseCase.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public protocol DetailCheckUseCase: UseCase
where Request == NewsModel, Response == Bool {
    func isFavorite(news: Request) -> Observable<Response>
}
