//
//  Post.swift
//  CleanSwiftTests
//
//  Created by Aleksey Pleshkov on 28.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

struct Post: Decodable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
