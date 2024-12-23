//
//  HomeArticleApi.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 15/12/24.
//

public struct HomeArticleApi: Codable, Sendable {
    let source: HomeSourceApi?
    let author, content, description, urlToImage: String?
    let title, url, publishedAt: String?
}
