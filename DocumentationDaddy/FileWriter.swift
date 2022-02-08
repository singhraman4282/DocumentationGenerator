//
//  FileWriter.swift
//  DocumentationDaddy
//
//  Created by Raman Singh on 2022-02-07.
//

import Foundation

struct FileWriter {
  
  static private func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
  }
  
  static func writeToFile(_ val: String) {
    let fileName = "KewlFile.md"
    let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
    let data = val.data(using: .utf8)
    
    FileManager.default.createFile(
      atPath: fileURL.path, contents: data, attributes: nil)
    print(fileURL.path)
  }
  
}
