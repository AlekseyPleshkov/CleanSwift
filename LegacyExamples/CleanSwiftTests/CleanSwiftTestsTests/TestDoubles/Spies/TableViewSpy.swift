//
//  TableViewSpy.swift
//  CleanSwiftTestsTests
//
//  Created by Aleksey Pleshkov on 29.10.2019.
//  Copyright © 2019 Aleksey Pleshkov. All rights reserved.
//

import UIKit

final class TableViewSpy: UITableView {
  
  // MARK: - Public Properties
  
  private(set) var isCalledReloadData = false
  
  // MARK: - Public Methods
  
  override func reloadData() {
    super.reloadData()
    isCalledReloadData = true
  }
}
