//
//  PersonViewModel.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 4/3/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import Bond
import SwiftyJSON

class PersonTableViewModel {
    let people = ObservableArray<Person>()

    func downloadPerson() {
        SwapiProvider.request(.People) { (result) in
            switch result {
            case let .Success(response):
                let json = JSON(data: response.data)["results"].arrayValue
                print(json)
                let mappedPeople = json.map { Person.fromJSON($0) }
                print(mappedPeople)
                self.people.removeAll()
                self.people.insertContentsOf(mappedPeople, atIndex: 0)
            case let .Failure(error):
                print(error.response)
            }
        }
    }
}