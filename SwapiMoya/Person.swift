//
//  Person.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 3/27/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Person: JSONable {
    var name: String
    var birthYear: String
    var homeworld: String
    
    init(name: String, birthYear: String, homeworld: String) {
        self.name = name
        self.birthYear = birthYear
        self.homeworld = homeworld
    }

    static func fromJSON(json: JSON) -> Person {
        let name = json["name"].stringValue
        let birthYear = json["birth_year"].stringValue
        let homeworld = json["homeworld"].stringValue
        return Person(name: name, birthYear: birthYear, homeworld: homeworld)
    }
    
    static func arrayFromJSON(object: AnyObject) -> [Person] {
        let json = JSON(object)
        return json["results"].arrayValue.map {
            return Person.fromJSON($0)
        }
    }

}