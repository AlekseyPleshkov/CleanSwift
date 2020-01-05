//
//  DetailModels.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum DetailModels {

  /// Показать переданное сообщение из HomeDataStore
  enum ShowMessage {
    struct Request {
    }

    struct Response {
      let message: String?
    }

    struct ViewModel {
      let message: String?
    }
  }
}
