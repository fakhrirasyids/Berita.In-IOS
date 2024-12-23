//
//  SearchArticleApi.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 15/12/24.
//

public struct SearchArticleApi: Codable, Sendable {
    let source: SearchSourceApi?
    let author, content, description, urlToImage: String?
    let title, url, publishedAt: String?
}
