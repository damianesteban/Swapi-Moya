//
//  JSONAble.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 4/2/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONable {
    static func fromJSON(json: JSON) -> Self
    static func fromJSONArray(json: [String: AnyObject]) -> [Self]
}
