//
//  HomeModels.swift
//  CleanSwiftRouter
//
//  Created by Aleksey Pleshkov on 19/05/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

enum HomeModels {

  /// Обновление текста в Text Field нашей сцены
  enum UpdateMessage {
    
    struct Request {
      let message: String?
    }

    struct Response {
      let message: String?
    }

    struct ViewModel {
      let isUpdated: Bool
    }
  }
}
