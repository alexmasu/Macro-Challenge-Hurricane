//
//  MochiDatabase.swift
//  Macro-Challenge-Hurricane
//
//  Created by Marco Scaglione on 30/05/22.
//

import Foundation

class MochiDatabase: NSObject {
  static let privateDocsDir: URL = {
    // 1
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    // 2
    let documentsDirectoryURL = paths.first!.appendingPathComponent("PrivateDocuments")
    
    // 3
    do {
      try FileManager.default.createDirectory(at: documentsDirectoryURL,
                                              withIntermediateDirectories: true,
                                              attributes: nil)
    } catch {
      print("Couldn't create directory")
    }
    return documentsDirectoryURL
  }()

  class func nextMochiDocPath() -> URL? {
    // 1) Get all the files and folders within the database folder
    guard let files = try? FileManager.default.contentsOfDirectory(at: privateDocsDir, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else { return nil }
    var maxNumber = 0
    
    // 2) Get the highest numbered item saved within the database
    files.forEach {
      if $0.pathExtension == "mochi" {
        let fileName = $0.deletingPathExtension().lastPathComponent
        maxNumber = max(maxNumber, Int(fileName) ?? 0)
      }
    }
    
    // 3) Return a path with the consecutive number
    return privateDocsDir.appendingPathComponent("\(maxNumber + 1).mochi", isDirectory: true)
  }
  
  class func loadMochiDocs() -> [MochiDoc] {
    guard let files = try? FileManager.default.contentsOfDirectory(at: privateDocsDir, includingPropertiesForKeys: nil, options: .skipsHiddenFiles) else { return [] }
    
    return files
      .filter { $0.pathExtension == "mochi" }
      .map { MochiDoc(docPath: $0) }
  }
}
