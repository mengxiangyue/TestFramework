print("Hello, world!")

import xcodeproj
import PathKit

// 主要是为了能够使用 guard let else return
func main() throws {
    let path = Path("/Users/Xiangyue.Meng/Downloads/TestFramework/TestFramework.xcodeproj")
    let xcodeproj = try XcodeProj(path: path)

    //         8D399B7022339984000F67F3 /* CoreService.framework */ = {isa = PBXFileReference; lastKnownFileType = wrapper.framework; path = CoreService.framework; sourceTree = "<group>"; };
//    PBXFileReference(sourceTree: <#T##PBXSourceTree?#>, name: <#T##String?#>, fileEncoding: <#T##UInt?#>, explicitFileType: <#T##String?#>, lastKnownFileType: <#T##String?#>, path: <#T##String?#>, includeInIndex: <#T##Bool?#>, wrapsLines: <#T##Bool?#>, usesTabs: <#T##Bool?#>, indentWidth: <#T##UInt?#>, tabWidth: <#T##UInt?#>, lineEnding: <#T##UInt?#>, languageSpecificationIdentifier: <#T##String?#>, xcLanguageSpecificationIdentifier: <#T##String?#>, plistStructureDefinitionIdentifier: <#T##String?#>)
//    let file = PBXFileElement(sourceTree: PBXSourceTree.group, path: "CoreService.framework", name: "CoreService.framework", includeInIndex: nil, usesTabs: nil, indentWidth: nil, tabWidth: nil, wrapsLines: nil)
//    let buildFile = PBXBuildFile(file: file)
    
    guard let target = xcodeproj.pbxproj.targets(named: "UserService").first else {
        print("not find")
        return
    }
    
    let frameworksBuildPhase = target.buildPhases.filter({ (phase) -> Bool in
        return phase.buildPhase == .frameworks
    })
//    frameworksBuildPhase.first?.files.append(buildFile)
    if let files = frameworksBuildPhase.first?.files {
        for file in files {
            print("\(file.file?.path)")
        }
    }
    
    if let group = xcodeproj.pbxproj.groups.filter( { $0.path == "SubBins" } ).first {
        
        let file = try group.addFile(at: Path("/Users/Xiangyue.Meng/Downloads/TestFramework/TestFramework/SubBins/CoreService.framework"), sourceRoot: Path("CoreService.framework"))
        let buildFile = PBXBuildFile(file: file)
        frameworksBuildPhase.first?.files.append(buildFile)
    }
    
//    if let fileRef = xcodeproj.pbxproj.fileReferences.filter({ $0.name == "CoreService.framework"} ).first {
//        frameworksBuildPhase.first?.files.append(PBXBuildFile(file: fileRef))
//    }
    
    
    
//    frameworksBuildPhase.first?.files.removeAll()
//
//
//    guard let coreServiceTarget = xcodeproj.pbxproj.targets(named: "CoreService").first else { fatalError() }
//    guard let coreServiceRef = coreServiceTarget.product else { fatalError() }
//    let coreServiceBuildFile = PBXBuildFile(file: coreServiceRef)
//    frameworksBuildPhase.first?.files.append(coreServiceBuildFile)
    
    
//    if let list = target.buildConfigurationList?.buildConfigurations {
//
//        let key = "LD_RUNPATH_SEARCH_PATHS"
//        let runPathSearchPath = "$(PROJECT_DIR)/TestFramework/SubBins"
//
//        for conf in list where conf.buildSettings[key] != nil {
//            if var ary = conf.buildSettings[key] as? [String], ary.contains(runPathSearchPath) == false {
//                ary.append(runPathSearchPath)
//                conf.buildSettings[key] = ary as Any
//            }
//        }
//    }
    

    try xcodeproj.write(path: path)

}

try main()




