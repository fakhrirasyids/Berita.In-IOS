//
//  NetworkConstants.swift
//  Berita.In
//
//  Created by Fakhri Rasyid Saputro on 15/12/24.
//

import Foundation

public struct NetworkConstants {
    static let baseUrl = "https://newsapi.org/v2/"

    public static var apiKey: String {
        guard let filePath = Bundle.module.path(forResource: "NewsApi-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'NewsApi-Info.plist' in the package bundle.")
        }
        guard let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("Failed to load 'NewsApi-Info.plist' from the package bundle.")
        }
        guard let value = plist.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'NewsApi-Info.plist'.")
        }
        return value
    }

    public static func constructParams(category: String? = nil, query: String? = nil) -> [String: String] {
        var params: [String: String] = [
            "apiKey": apiKey
        ]

        if let category = category {
            params["category"] = category.lowercased()
        }

        if let query = query {
            params["q"] = query
        } else {
            params["country"] = "us"
        }

        return params
    }
}

public enum Params {
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology

    public var category: String {
        switch self {
        case .general:
            return ""
        case .business:
            return "Business"
        case .entertainment:
            return "Entertainment"
        case .health:
            return "Health"
        case .science:
            return "Science"
        case .sports:
            return "Sports"
        case .technology:
            return "Technology"
        }
    }
}

public enum Endpoints {
    case everything
    case topHeadlines

    public var url: String {
        switch self {
        case .everything: return "\(NetworkConstants.baseUrl)everything"
        case .topHeadlines: return "\(NetworkConstants.baseUrl)top-headlines"
        }
    }
}
