//
//  SwapiService.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 5/23/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct SwapiService {
    
    let baseURLString = "http://swapi.co/api"
    
    func fetchPeople() -> Observable<[Person]> {
        return NSURLSession.sharedSession().rx_JSON(NSURL(string: baseURLString + "/people")!)
            .observeOn(MainScheduler.instance)
            .map { json in
                return Person.arrayFromJSON(json)
        }
    }
    
}
