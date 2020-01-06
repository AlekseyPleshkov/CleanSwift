//
//  NetworkWorker.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

protocol NetworkWorkingLogic {
  /// Main request to API
  func sendRequest(to: URL, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkWorker: NetworkWorkingLogic {

  // MARK: - Private Properties

  private let session = URLSession.shared

  // MARK: - NetworkWorkingLogic

  func sendRequest(to: URL, params: [String: String], completion: @escaping (Data?, Error?) -> Void) {
    guard var urlComponents = URLComponents(url: to, resolvingAgainstBaseURL: false) else {
      completion(nil, nil)
      return
    }

    urlComponents.queryItems = params.map {
      URLQueryItem(name: $0.key, value: $0.value)
    }

    guard let requestURL = urlComponents.url else {
      completion(nil, nil)
      return
    }

    let request = session.dataTask(with: requestURL) { (data, response, error) in
      OperationQueue.main.addOperation {
        if let error = error {
          completion(nil, error)
          return
        }

        completion(data, nil)
      }
    }

    request.resume()
  }
}
