//
//  ViewController.swift
//  DocumentationDaddy
//
//  Created by Raman Singh on 2022-02-07.
//

import UIKit

class ViewController: UIViewController {
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let extractor = DocumentationExtractor(fileName: "publicationfactory")
    // let extractor = DocumentationExtractor(fileName: "navigator")
    let publication = DocumentationExtractor(fileName: "publicationfactory")
      .createDocumentationForClass()
    
    let navigator = DocumentationExtractor(fileName: "navigator")
      .createDocumentationForClass()
    
    DocumentationGenerator.writeToFile([publication, navigator])
    
    
  }


}

