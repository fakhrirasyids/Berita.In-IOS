//
//  SearchNewsResponse.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 15/12/24.
//

public struct SearchNewsResponse: Codable, Sendable {
    let status: String
    let totalResults: Int
    let articles: [SearchArticleApi]
}
