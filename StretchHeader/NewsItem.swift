//
//  NewsItem.swift
//  StretchHeader
//
//  Created by Frank Chen on 2019-06-11.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

import Foundation
import UIKit

enum categories:String, CustomStringConvertible{
  var description: String{
    return self.rawValue
  }
  
  case World = "World"
  case Americas = "Americas"
  case Europe = "Europe"
  case MiddleEast = "MiddleEast"
  case Africa = "Africa"
  case Asia = "Asia Pacific"
}


struct NewsItem {
  var category:String
  var headline:String
}
