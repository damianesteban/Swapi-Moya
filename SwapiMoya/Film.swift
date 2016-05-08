//
//  Film.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 3/27/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation

struct Film {
    let url: String
    let title: String?
    let episodeID: Int?
    let openingCrawl: String?
    let director: String?
    
    init(url: String, title: String? = nil, episodeID: Int? = nil, openingCrawl: String? = nil, director: String? = nil) {
        self.url = url
        self.title = title
        self.episodeID = episodeID
        self.openingCrawl = openingCrawl
        self.director = director
    }
}
