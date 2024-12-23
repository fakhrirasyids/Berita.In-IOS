//
//  NewsModel.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 15/12/24.
//

public struct NewsModel: Equatable {
    public let author: String?
    public let content: String?
    public let description: String?
    public let urlToImage: String?
    public let title: String?
    public let url: String?
    public let publishedAt: String?

    public init(
        author: String?,
        content: String?,
        description: String?,
        urlToImage: String?,
        title: String?,
        url: String?,
        publishedAt: String?
    ) {
        self.author = author
        self.content = content
        self.description = description
        self.urlToImage = urlToImage
        self.title = title
        self.url = url
        self.publishedAt = publishedAt
    }
}
