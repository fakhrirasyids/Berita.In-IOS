//
//  FavoritesUseCase.swift
//  Favorites
//
//  Created by Fakhri Rasyid Saputro on 23/12/24.
//

import RxSwift
import BeritaInCore
import Common

public protocol FavoritesUseCase: UseCase
where Request == Bool, Response == [NewsModel] {
    func getNews(request: Request) -> Observable<Response>
}
