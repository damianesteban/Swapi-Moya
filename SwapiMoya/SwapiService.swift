//
//  SwapiService.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 4/2/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import Moya

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}


let SwapiProvider = MoyaProvider<Swapi>(plugins: [NetworkLoggerPlugin()])

public enum Swapi {
    case People, Films(String)
}

extension Swapi: TargetType {
    public var baseURL: NSURL { return NSURL(string: "http://swapi.co/api")! }
    public var path: String {
        switch self {
        case .People:
            return "/people"
        case .Films(let id):
            return "/films/\(id.URLEscapedString)"
        }
    }
    
    public var method: Moya.Method {
        return .GET
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case .People:
            return nil
        case .Films(_):
            return nil
        }
    }
    
    public var sampleData: NSData {
        switch self {
        case .People:
            return "Half measures are as bad as nothing at all.".dataUsingEncoding(NSUTF8StringEncoding)!
        case .Films(_):
            return "Half measures are as bad as nothing at all.".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
}


