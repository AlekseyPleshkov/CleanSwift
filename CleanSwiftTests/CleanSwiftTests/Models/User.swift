//
//  User.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

struct User: Decodable {
  let id: Int
  let name: String
  let username: String
}
