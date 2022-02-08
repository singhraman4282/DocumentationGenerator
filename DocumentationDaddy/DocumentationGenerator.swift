//
//  DocumentationGenerator.swift
//  DocumentationDaddy
//
//  Created by Raman Singh on 2022-02-07.
//

import Foundation

struct DocumentationGenerator {
  
  static func writeToFile(_ vals: [String?]) {
    let result = vals.compactMap { $0 }
      .reduce("# FlowPub iOS SDK\n\n## The SDK exposes below methods to consumers.") { $0 + "\n\n" + $1 }
    
    FileWriter.writeToFile(result)
  }
  
}

/*
 
 # FlowPub iOS SDK
 
 ## The SDK exposes below methods to consumers.
 */
