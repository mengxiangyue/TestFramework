print("Hello, world!")

import xcodeproj
import PathKit

// 主要是为了能够使用 guard let else return
func main() throws {
    let path = Path("/Users/Xiangyue.Meng/Downloads/TestFramework/TestFramework.xcodeproj")
    let xcodeproj = try XcodeProj(path: path)
    
    
    guard let target = xcodeproj.pbxproj.targets(named: "TestFramework").first else {
        print("not find")
        return
    }
    let frameworksBuildPhase = xcodeproj.pbxproj.buildPhases.filter({ (phase) -> Bool in
        return target.buildPhases.contains(phase) && phase.buildPhase == .frameworks
    })
    if let files = frameworksBuildPhase.first?.files {
        for file in files {
            print("\(file.file?.path)")
        }
    }
    
    frameworksBuildPhase.first?.files.removeAll()
//
//
//    guard let coreServiceTarget = xcodeproj.pbxproj.targets(named: "CoreService").first else { fatalError() }
//    guard let coreServiceRef = coreServiceTarget.product else { fatalError() }
//    let coreServiceBuildFile = PBXBuildFile(file: coreServiceRef)
//    frameworksBuildPhase.first?.files.append(coreServiceBuildFile)


    try xcodeproj.write(path: path)

}

try main()




