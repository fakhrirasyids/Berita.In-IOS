//
//  HomeHeadlinesRemoteDataSource.swift
//  Home
//
//  Created by Fakhri Rasyid Saputro on 21/12/24.
//
@preconcurrency import RxSwift
import BeritaInCore
import Alamofire
import Foundation
import Common

public class HomeHeadlinesRemoteDataSource: DataSource {
    public typealias Request = String
    public typealias Response = HomeNewsResponse

    public init() {}

    public func executeObservable(request: Request) -> Observable<Response> {
        return Observable.create { observer in
            let from = Endpoints.topHeadlines.url
            let params = NetworkConstants.constructParams(category: request)

            guard let url = URL(string: from) else {
                observer.onError(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                return Disposables.create()
            }

            let request = AF.request(url, parameters: params)
                .validate()
                .responseDecodable(of: Response.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
