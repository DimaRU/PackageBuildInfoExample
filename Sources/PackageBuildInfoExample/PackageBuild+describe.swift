/////
////  PackageBuild+describe.swift
///   Copyright © 2022 Dmitriy Borovikov. All rights reserved.
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
