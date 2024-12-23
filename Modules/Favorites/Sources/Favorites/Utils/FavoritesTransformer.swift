//
//  HomeTransformer.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import BeritaInCore
import Common

public class FavoritesTransformer: Mapper {
    public typealias Responses = [NewsEntity]
    public typealias Models = [NewsModel]

    public init() {}

    public func mapResponsesToModels(responses: Responses) -> Models {
        return responses
            .map { result in
                NewsModel(
                    author: result.author,
                    content: result.content,
                    description: result.desc,
                    urlToImage: result.urlToImage,
                    title: result.title,
                    url: result.url,
                    publishedAt: result.publishedAt
                )
            }
    }
}
