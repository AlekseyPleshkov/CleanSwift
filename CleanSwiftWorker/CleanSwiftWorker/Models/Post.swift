//
//  Post.swift
//  CleanSwiftWorker
//
//  Created by Aleksey Pleshkov on 10/06/2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import Foundation

struct Post: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
