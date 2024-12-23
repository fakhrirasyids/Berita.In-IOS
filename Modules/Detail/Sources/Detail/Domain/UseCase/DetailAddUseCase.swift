//
//  DetailAddUseCase.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public protocol DetailAddUseCase: UseCase
where Request == NewsModel, Response == Bool {
    func addFavorite(news: Request) -> Completable
}
