//
//  DocumentationExtractor.swift
//  DocumentationDaddy
//
//  Created by Raman Singh on 2022-02-07.
//

import Foundation

struct DocumentationExtractor {
  
  private let documentation: DocumentationElement
  
  init(fileName: String) {
    let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
    let data = try! Data(contentsOf: url)
    self.documentation = try! JSONDecoder().decode(DocumentationElement.self, from: data)
  }
  
  func createDocumentationForClass() -> String? {
    guard let title = getClassTitle() else {
      return nil
    }
    
    let methods = instanceMethods()
    let result = methods.reduce("\(title)\n\n---\n## Instance Methods\n\n") { $0 + $1 + "\n\n___\n\n" }
    
    return result
  }
  
  private func getClassTitle() -> String? {
    let classTitle = documentation.primaryContentSections
      .compactMap { $0.declarations }
      .flatMap { $0 }
      .map { $0.tokens }
      .flatMap { $0 }
      .reduce("") { $0 + $1.text }
    
    guard !classTitle.isEmpty else {
      return nil
    }
    
    return "# " + classTitle
  }
  
  private func instanceMethods() -> [String] {
    
    guard let topicSections = documentation.topicSections else {
      return []
    }
    
    let methods = topicSections
      .filter { $0.title == "Instance Methods" }
      .map { $0.identifiers }
      .flatMap { $0 }
      .compactMap { $0.components(separatedBy: "/").last }
      .map { $0.lowercased() }
      .compactMap { Bundle.main.url(forResource: $0, withExtension: "json") }
      .compactMap { try! Data(contentsOf: $0) }
      .compactMap { createDocument(from: $0) }
//      .compactMap { try? JSONDecoder().decode(DocumentationElement.self, from: $0) }
    
    return methods
      .compactMap { createMethodInfo(from: $0) }
      .sorted()
  }
  
  private func createMethodInfo(from method: DocumentationElement) -> String? {
    let methodNameElms = method.primaryContentSections
      .filter { $0.kind == "declarations" }
      .compactMap { $0.declarations }
      .flatMap { $0 }
      .flatMap { $0.tokens }
    
    let coreMethodItemContent = method.primaryContentSections
      .filter { $0.kind == "content" }
      .compactMap { $0.content }
      .flatMap { $0 }
      .compactMap { $0.items }
      .flatMap { $0 }
      .map { $0.content }
      .compactMap { $0 }
      .flatMap { $0 }
      .compactMap { $0.inlineContent}
      .flatMap { $0 }
    
    let data = try! JSONEncoder().encode(method)
    let str = String(data: data, encoding: .utf8) ?? ""
    if str.contains("setViewSettings") {
      print("")
    }
    
    guard
      let methodName = methodNameForHeading(from: methodNameElms),
      let methodDoc = methodDocumentation(from: method),
      let methodNameForDeclaration = fullMethodName(from: methodNameElms),
      let coreMethodName = coreMethod(coreMethodItemContent),
      let tagName = methodTagName(from: methodNameElms)
    else {
      return nil
    }
      
      if methodName.contains("setviewsettings") {
          print(method)
      }
    
    let deprecationMessage = getDeprecationSummary(method)
    let isDeprecated = !deprecationMessage.isEmpty
    let deprecationHeader = isDeprecated ? " _(Deprecated)_ " : ""
    
    let warningMessage = getWarning(from: method)
    
    return "\(methodName) \(deprecationHeader) \(tagName)  \n\(methodDoc)\n\n### Declaration  \n\(methodNameForDeclaration)\n\n\(coreMethodName)\(deprecationMessage)\(warningMessage)"
  }
  
  private func getWarning(from method: DocumentationElement) -> String {
    let sectionContent = method.primaryContentSections
      .compactMap { $0.content }
      .flatMap { $0 }
      .filter { $0.style == "warning" }
    
    guard !sectionContent.isEmpty else {
      return ""
    }
    
    let content = sectionContent
      .compactMap { $0.content }
      .flatMap { $0 }
      .flatMap { $0.inlineContent ?? [] }
      .compactMap { $0 }
      .compactMap { $0.text ?? $0.code }
      .reduce("") { $0 + $1 }
    
    guard !content.isEmpty else {
      return ""
    }

    return "\n\n### Warning  \n\(content)"
  }
  
  private func getDeprecationSummary(_ method: DocumentationElement) -> String {
    guard let summary = method.deprecationSummary else {
      return ""
    }
    
    let deprecationMessage = summary
      .flatMap { $0.inlineContent }
      .first?.text
    
    guard let deprecationMessage = deprecationMessage else {
      return ""
    }
    
    return "\n\n>**Deprecated** - \(deprecationMessage)"
  }
  
  /// [View in Source](x-source-tag://makePublication
  private func methodTagName(from elements: [TokenElement]) -> String? {
    let result = elements.first { $0.kind == .identifier }?.text
    guard let result = result, !result.isEmpty else {
      return nil
    }
    
    return "[View in Source](x-source-tag://\(result))"
  }
  
  /// **makePublication(type:with:completion:)**
  private func methodNameForHeading(from elements: [TokenElement]) -> String? {
    let name = elements
      .filter { $0.kind == .identifier }
      .map { $0.text }
      .reduce("") { $0 + $1 }
    
    guard !name.isEmpty else {
      return nil
    }
    
    var externals = elements
      .filter { $0.kind == .externalParam }
      .map { $0.text }
      .reduce("") { $0 + $1 + "\\_:" }
    
    if externals.isEmpty {
      externals = "()"
    }
    
    return "**" + name + "(" + externals + ")**"
  }
  
  /// _Makes a Publication model by parsing an input publication format._
  private func methodDocumentation(from method: DocumentationElement) -> String? {
    let result = method.abstract
      .compactMap { $0.text ?? $0.code }
      .reduce("") { $0 + $1 }
    
    guard !result.isEmpty else {
      return nil
    }
    
    return "_" + result + "_"
  }
  
  
    /// func makePublication(type publicationFormat: PublicationFormat, with entryURL: URL, completion: @escaping (Result<Publication, Error>) -> Void)
  private func fullMethodName(from elements: [TokenElement]) -> String? {
    "`" + elements.reduce("") { $0 + $1.text } + "`"
  }
  
  /// "## Methods used from Core  \'Publication::async parseFromJSON(string: selfURL?) : Promise(Publication)\'"
  private func coreMethod(_ elements: [InlineContentElement]) -> String? {
    let result = elements
      .compactMap { $0.code }
      .reduce("") { $0 + "`" + $1 + "`\n\n" }
    
    guard !result.isEmpty else {
      return nil
    }
    return "### Methods used from Core  \n" + result
  }
  
  private func createDocument(from data: Data) -> DocumentationElement? {
    let str = String(data: data, encoding: .utf8)
    do {
      return try JSONDecoder().decode(DocumentationElement.self, from: data)
    } catch {
      print(error)
      print(str)
      return nil
    }
  }
  
}
