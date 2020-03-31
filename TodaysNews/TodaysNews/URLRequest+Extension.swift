//
//  URLRequest+Extension.swift
//  TodaysNews
//
//  Created by Krishna Datt Shukla on 19/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct Resource<T: Codable> {
    let url: URL
}


extension URLRequest {
    
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        return Observable.just(resource.url)
        .flatMap { url -> Observable<Data> in
            let request = URLRequest(url: url)
            return URLSession.shared.rx.data(request: request)
        }
        .map { data -> T? in
            return try? JSONDecoder().decode(T.self, from: data)
        }.asObservable()
    }
}
