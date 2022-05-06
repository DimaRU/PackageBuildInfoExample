//
//  PackageBuild+describe.swift
//  
//
//  Created by Dmitriy Borovikov on 06.05.2022.
//

import Foundation

extension PackageBuild {
    var describe: String {
        if tag == nil,
           digest.isEmpty {
            return "dirty"
        }
        guard tag != nil else {
            return String(commit.prefix(8))
        }
        var desc = tag!
        if countSince != 0 {
            desc += "-" + String(countSince) + "-g" + commit.prefix(7)
        }
        if isDirty {
            desc += "-dirty"
        }
        return desc
    }
}
