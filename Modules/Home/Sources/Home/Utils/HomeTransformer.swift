//
//  HomeTransformer.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//

import BeritaInCore
import Common

public class HomeTransformer: Mapper {
    public typealias Responses = [HomeArticleApi]
    public typealias Models = [NewsModel]

    public init() {}

    public func mapResponsesToModels(responses: Responses) -> Models {
        return responses
            .filter { $0.title != "[Removed]" && $0.urlToImage != nil }
            .map { result in
                NewsModel(
                    author: result.author,
                    content: result.content,
                    description: result.description,
                    urlToImage: result.urlToImage,
                    title: result.title,
                    url: result.url,
                    publishedAt: String(result.publishedAt?.split(separator: "T").first ?? "")
                )
            }
    }
}
