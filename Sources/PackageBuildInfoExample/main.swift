/////
////  main.swift
///   Copyright © 2022 Dmitriy Borovikov. All rights reserved.
//

import Foundation

print("Build:", PackageBuild.info.describe)
let info = PackageBuild.info
print("Package build info:")
let dateFormater = DateFormatter()
dateFormater.timeZone = PackageBuild.info.timeZone
dateFormater.dateStyle = .short
dateFormater.timeStyle = .short
let timeString = dateFormater.string(from: info.timeStamp)

let detail = """
Time:          \(timeString)
Branch:        \(info.branch!)
Tag:           \(info.tag ?? "")
Commit count:  \(info.count)
Commits since: \(info.countSince)
ID:            \(info.commit)
"""
print(detail)
if info.isDirty {
    print("Dirty build (have uncommitted changes)")
}
