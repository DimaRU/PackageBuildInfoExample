import Foundation

let buildInfo = PackageBuildInfo.current
print("Package build info:")
guard !buildInfo.isDirty else {
    print("Dirty build")
    exit(0)
}
let dateFormater = DateFormatter()
dateFormater.timeZone = PackageBuildInfo.current.timeZone
dateFormater.dateStyle = .short
dateFormater.timeStyle = .short
let timeString = dateFormater.string(from: buildInfo.timeStamp)

let info = """
Time:      \(timeString)
Commit no: \(buildInfo.count!)
Branch:    \(buildInfo.branch!)
Tag:       \(buildInfo.tag ?? "")
ID:        \(buildInfo.commit)
"""
print(info)
