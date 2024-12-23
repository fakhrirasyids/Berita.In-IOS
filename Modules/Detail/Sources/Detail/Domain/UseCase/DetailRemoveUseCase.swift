//
//  DetailRemoveUseCase.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import RxSwift
import BeritaInCore
import Common

public protocol DetailRemoveUseCase: UseCase
where Request == NewsModel, Response == Bool {
    func removeFavorite(news: Request) -> Completable
}
