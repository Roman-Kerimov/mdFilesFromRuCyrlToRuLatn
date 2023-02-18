import Foundation
import LinguisticKit

while true {
    guard let line = readLine() else {
        break
    }
    
    let mdURL = URL(fileURLWithPath: line, relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath))
    
    guard mdURL.pathExtension == "md" else {
        continue
    }
    
    do {
        let md = try String(contentsOf: mdURL)
        let mdLatn = md.applyingTransform(from: .Cyrl, to: .Latn, withTable: .ru)!
        
        let mdLatnURL = mdURL.deletingPathExtension().appendingPathExtension("ru_Latn.md")
        try mdLatn.write(to: mdLatnURL, atomically: true, encoding: .utf8)
    } catch {
        fatalError(error.localizedDescription)
    }
}
