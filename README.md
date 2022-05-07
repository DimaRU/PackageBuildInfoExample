![swift-version](https://img.shields.io/badge/swift-5.6-brightgreen.svg?style=for-the-badge)
![Mac OS](https://img.shields.io/badge/-platform-gray?style=for-the-badge)![Mac OS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=Apple&logoColor=F0F0F0)![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
[![License](https://img.shields.io/github/license/yonaskolb/Mint.svg?style=for-the-badge)](LICENSE)

# PackageBuildInfo sample project.


#### Automated Swift Package version and build numbering via Git. 

Wouldn't it be great if your Swift Package-based projects just take their version and build number automatically from git? Well, now it can!

Using a new amazing feature - Swift Package Manager prebuild plugin, you can generate .swift file with current build info from git. It will never modify your local project.

## Requirements

* SwiftPM 5.6 or later.
* git

## Prerequisite

##### Install PackageBuildInfo tool:

* Using the [Mint](https://github.com/yonaskolb/Mint):

```bash
mint install DimaRU/PackageBuildInfo
```

* or build manually:

```bash
git clone https://github.com/DimaRU/PackageBuildInfo
cd PackageBuildInfo
swift build -c release
cp .build/release/packageBuildInfo /usr/local/bin
```

## Build and run

* Add to package dependencies:

```bash
git clone https://github.com/DimaRU/PackageBuildInfoExample
cd PackageBuildInfoExample
swift run
```


## Generated file example:

```swift
/////
//// Package Build info
///  Code generated by PackageBuildInfo. DO NOT EDIT.
//
import Foundation

public struct PackageBuild {
    let isDirty: Bool       // Dirty build - git directory is't clean.
    let timeStamp: Date     // Time of last commit
    let timeZone: TimeZone  // Time Zone
    let count: Int          // Total commit count
    let tag: String?        // Tag, if exist
    let countSince: Int     // Commit count since tag
    let branch: String?     // Git branch name
    let digest: [UInt8]     // Latest commit sha1 digest (20 bytes)

    var commit: String {
        digest.reduce("") { $0 + String(format: "%02x", $1) }
    }
    static let info = PackageBuild(
                              isDirty: false,
                              timeStamp: Date(timeIntervalSince1970: 1651860865),
                              timeZone: TimeZone(secondsFromGMT: 10800)!,
                              count: 4,
                              tag: "0.0.1",
                              countSince: 3,
                              branch: "master",
                              digest: [0xee, 0x53, 0x6a, 0x73, 0xff, 0xc6, 0x16, 0x76, 0x50, 0xe9, 
                                       0x5e, 0x2c, 0xd2, 0xa8, 0xcb, 0x96, 0x38, 0x49, 0x15, 0xc7])
}
```

## License

[MIT](LICENSE)
