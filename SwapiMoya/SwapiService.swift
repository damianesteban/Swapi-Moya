//
//  SwapiService.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 5/23/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(data: NSData) -> NSData {
    do {
        let dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        let prettyData =  try NSJSONSerialization.dataWithJSONObject(dataAsJSON, options: .PrettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

let SwapiProvider = RxMoyaProvider<SwapiService>(plugins: [NetworkLoggerPlugin(verbose: true,
    responseDataFormatter: JSONResponseDataFormatter)])

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

enum SwapiService {
    case People
}

extension SwapiService: TargetType {
    var baseURL: NSURL { return NSURL(string: "http://swapi.co/api")! }
    
    var path: String {
        switch self {
        case .People:
            return "/people"
        }
    }
    
    var method: Moya.Method {
        return .GET
    }
    
    var parameters: [String: AnyObject]? {
        return nil
    }
    
    var sampleData: NSData {
        switch self {
        case .People:
            return "".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}