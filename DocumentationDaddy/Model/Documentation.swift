//
//  Documentation.swift
//  DocumentationDaddy
//
//  Created by Raman Singh on 2022-02-07.
//

  // This file was generated from JSON Schema using quicktype, do not modify it directly.
  // To parse the JSON, add this file to your project and do:
  //
  //   let documentation = try? newJSONDecoder().decode(Documentation.self, from: jsonData)

import Foundation

  // MARK: - DocumentationElement
struct DocumentationElement: Codable {
  let primaryContentSections: [PrimaryContentSection]
  let schemaVersion: SchemaVersion
  let sections: [JSONAny]
  let variants: [Variant]
  let relationshipsSections: [RelationshipsSection]?
  let identifier: Identifier
  let abstract: [InlineContentElement]
  let kind: RoleEnum
  let metadata: Metadata
  let hierarchy: Hierarchy
  let topicSections: [TopicSection]?
  let deprecationSummary: [DeprecationSummary]?
  let references: [String: Reference]
  
  enum CodingKeys: String, CodingKey {
    case primaryContentSections
    case schemaVersion
    case sections
    case variants
    case relationshipsSections
    case identifier
    case abstract
    case kind
    case metadata
    case hierarchy
    case topicSections
    case references
    case deprecationSummary
  }
}

  // MARK: - DeprecationSummary
struct DeprecationSummary: Codable {
  let type: String
  let inlineContent: [InlineContent]
  
  enum CodingKeys: String, CodingKey {
    case type
    case inlineContent
  }
}

  // MARK: - InlineContentElement
struct InlineContentElement: Codable {
  let type: AbstractType
  let text: String?
  let code: String?
  
  enum CodingKeys: String, CodingKey {
    case type
    case text
    case code
  }
}

enum AbstractType: String, Codable {
  case codeVoice = "codeVoice"
  case emphasis = "emphasis"
  case text = "text"
  case aside = "aside"
}

  // MARK: - Hierarchy
struct Hierarchy: Codable {
  let paths: [[String]]
  
  enum CodingKeys: String, CodingKey {
    case paths
  }
}

  // MARK: - Identifier
struct Identifier: Codable {
  let url: String
  let interfaceLanguage: String
  
  enum CodingKeys: String, CodingKey {
    case url
    case interfaceLanguage
  }
}

enum RoleEnum: String, Codable {
  case collection = "collection"
  case symbol = "symbol"
}

  // MARK: - Metadata
struct Metadata: Codable {
  let fragments: [TokenElement]
  let title: String
  let roleHeading: String
  let role: RoleEnum
  let symbolKind: String
  let externalID: String
  let modules: [Module]
  let navigatorTitle: [NavigatorTitle]?
  
  enum CodingKeys: String, CodingKey {
    case fragments
    case title
    case roleHeading
    case role
    case symbolKind
    case externalID
    case modules
    case navigatorTitle
  }
}

  // MARK: - TokenElement
struct TokenElement: Codable {
  let kind: FragmentKind
  let text: String
  let preciseIdentifier: String?
  let identifier: String?
  
  enum CodingKeys: String, CodingKey {
    case kind
    case text
    case preciseIdentifier
    case identifier
  }
}

enum FragmentKind: String, Codable {
  case externalParam = "externalParam"
  case identifier = "identifier"
  case internalParam = "internalParam"
  case keyword = "keyword"
  case text = "text"
  case typeIdentifier = "typeIdentifier"
}

  // MARK: - Module
struct Module: Codable {
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case name
  }
}

  // MARK: - NavigatorTitle
struct NavigatorTitle: Codable {
  let kind: FragmentKind
  let text: String
  
  enum CodingKeys: String, CodingKey {
    case kind
    case text
  }
}

  // MARK: - PrimaryContentSection
struct PrimaryContentSection: Codable {
  let kind: String
  let declarations: [Declaration]?
  let content: [PrimaryContentSectionContent]?
  
  enum CodingKeys: String, CodingKey {
    case kind
    case declarations
    case content
  }
}

  // MARK: - PrimaryContentSectionContent
struct PrimaryContentSectionContent: Codable {
  let anchor: String?
  let level: Int?
  let type: String
  let text: String?
  let style: String?
  let content: [ItemContent]?
  let items: [Item]?
  
  
  enum CodingKeys: String, CodingKey {
    case anchor
    case level
    case type
    case text
    case items
    case content
    case style
  }
}

  // MARK: - Item
struct Item: Codable {
  let content: [ItemContent]?
  
  enum CodingKeys: String, CodingKey {
    case content
  }
}

  // MARK: - ItemContent
struct ItemContent: Codable {
  let type: String
  let inlineContent: [InlineContentElement]?
  
  enum CodingKeys: String, CodingKey {
    case type
    case inlineContent
  }
}

  // MARK: - Declaration
struct Declaration: Codable {
  let tokens: [TokenElement]
  let languages: [String]
  let platforms: [String]
  
  enum CodingKeys: String, CodingKey {
    case tokens
    case languages
    case platforms
  }
}

  // MARK: - InlineContent
struct InlineContent: Codable {
  let type: AbstractType
  let text: String
  
  enum CodingKeys: String, CodingKey {
    case type
    case text
  }
}

  // MARK: - Reference
struct Reference: Codable {
  let role: RoleEnum
  let title: String
  let abstract: [ReferenceAbstract]
  let identifier: String
  let kind: RoleEnum
  let type: ReferenceType
  let url: String
  let fragments: [ReferenceFragment]?
  let navigatorTitle: [NavigatorTitle]?
  let deprecated: Bool?
  
  enum CodingKeys: String, CodingKey {
    case role
    case title
    case abstract
    case identifier
    case kind
    case type
    case url
    case fragments
    case navigatorTitle
    case deprecated
  }
}

  // MARK: - ReferenceAbstract
struct ReferenceAbstract: Codable {
  let type: AbstractType
  let text: String?
  let code: Code?
  let inlineContent: [InlineContent]?
  
  enum CodingKeys: String, CodingKey {
    case type
    case text
    case code
    case inlineContent
  }
}

enum Code: String, Codable {
  case publication = "Publication"
  case webView = "WebView"
  case webViewFactory = "WebViewFactory"
}

  // MARK: - ReferenceFragment
struct ReferenceFragment: Codable {
  let kind: FragmentKind
  let text: String
  let preciseIdentifier: String?
  
  enum CodingKeys: String, CodingKey {
    case kind
    case text
    case preciseIdentifier
  }
}

enum ReferenceType: String, Codable {
  case topic = "topic"
}

  // MARK: - RelationshipsSection
struct RelationshipsSection: Codable {
  let identifiers: [String]
  let kind: String
  let title: String
  let type: String
  
  enum CodingKeys: String, CodingKey {
    case identifiers
    case kind
    case title
    case type
  }
}

  // MARK: - SchemaVersion
struct SchemaVersion: Codable {
  let major: Int
  let minor: Int
  let patch: Int
  
  enum CodingKeys: String, CodingKey {
    case major
    case minor
    case patch
  }
}

  // MARK: - TopicSection
struct TopicSection: Codable {
  let title: String
  let identifiers: [String]
  
  enum CodingKeys: String, CodingKey {
    case title
    case identifiers
  }
}

  // MARK: - Variant
struct Variant: Codable {
  let paths: [String]
  let traits: [Trait]
  
  enum CodingKeys: String, CodingKey {
    case paths
    case traits
  }
}

  // MARK: - Trait
struct Trait: Codable {
  let interfaceLanguage: String
  
  enum CodingKeys: String, CodingKey {
    case interfaceLanguage
  }
}

typealias Documentation = [DocumentationElement]

  // MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}

class JSONCodingKey: CodingKey {
  let key: String
  
  required init?(intValue: Int) {
    return nil
  }
  
  required init?(stringValue: String) {
    key = stringValue
  }
  
  var intValue: Int? {
    return nil
  }
  
  var stringValue: String {
    return key
  }
}

class JSONAny: Codable {
  
  let value: Any
  
  static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
    let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
    return DecodingError.typeMismatch(JSONAny.self, context)
  }
  
  static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
    let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
    return EncodingError.invalidValue(value, context)
  }
  
  static func decode(from container: SingleValueDecodingContainer) throws -> Any {
    if let value = try? container.decode(Bool.self) {
      return value
    }
    if let value = try? container.decode(Int64.self) {
      return value
    }
    if let value = try? container.decode(Double.self) {
      return value
    }
    if let value = try? container.decode(String.self) {
      return value
    }
    if container.decodeNil() {
      return JSONNull()
    }
    throw decodingError(forCodingPath: container.codingPath)
  }
  
  static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
    if let value = try? container.decode(Bool.self) {
      return value
    }
    if let value = try? container.decode(Int64.self) {
      return value
    }
    if let value = try? container.decode(Double.self) {
      return value
    }
    if let value = try? container.decode(String.self) {
      return value
    }
    if let value = try? container.decodeNil() {
      if value {
        return JSONNull()
      }
    }
    if var container = try? container.nestedUnkeyedContainer() {
      return try decodeArray(from: &container)
    }
    if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
      return try decodeDictionary(from: &container)
    }
    throw decodingError(forCodingPath: container.codingPath)
  }
  
  static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
    if let value = try? container.decode(Bool.self, forKey: key) {
      return value
    }
    if let value = try? container.decode(Int64.self, forKey: key) {
      return value
    }
    if let value = try? container.decode(Double.self, forKey: key) {
      return value
    }
    if let value = try? container.decode(String.self, forKey: key) {
      return value
    }
    if let value = try? container.decodeNil(forKey: key) {
      if value {
        return JSONNull()
      }
    }
    if var container = try? container.nestedUnkeyedContainer(forKey: key) {
      return try decodeArray(from: &container)
    }
    if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
      return try decodeDictionary(from: &container)
    }
    throw decodingError(forCodingPath: container.codingPath)
  }
  
  static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
    var arr: [Any] = []
    while !container.isAtEnd {
      let value = try decode(from: &container)
      arr.append(value)
    }
    return arr
  }
  
  static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
    var dict = [String: Any]()
    for key in container.allKeys {
      let value = try decode(from: &container, forKey: key)
      dict[key.stringValue] = value
    }
    return dict
  }
  
  static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
    for value in array {
      if let value = value as? Bool {
        try container.encode(value)
      } else if let value = value as? Int64 {
        try container.encode(value)
      } else if let value = value as? Double {
        try container.encode(value)
      } else if let value = value as? String {
        try container.encode(value)
      } else if value is JSONNull {
        try container.encodeNil()
      } else if let value = value as? [Any] {
        var container = container.nestedUnkeyedContainer()
        try encode(to: &container, array: value)
      } else if let value = value as? [String: Any] {
        var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
        try encode(to: &container, dictionary: value)
      } else {
        throw encodingError(forValue: value, codingPath: container.codingPath)
      }
    }
  }
  
  static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
    for (key, value) in dictionary {
      let key = JSONCodingKey(stringValue: key)!
      if let value = value as? Bool {
        try container.encode(value, forKey: key)
      } else if let value = value as? Int64 {
        try container.encode(value, forKey: key)
      } else if let value = value as? Double {
        try container.encode(value, forKey: key)
      } else if let value = value as? String {
        try container.encode(value, forKey: key)
      } else if value is JSONNull {
        try container.encodeNil(forKey: key)
      } else if let value = value as? [Any] {
        var container = container.nestedUnkeyedContainer(forKey: key)
        try encode(to: &container, array: value)
      } else if let value = value as? [String: Any] {
        var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
        try encode(to: &container, dictionary: value)
      } else {
        throw encodingError(forValue: value, codingPath: container.codingPath)
      }
    }
  }
  
  static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
    if let value = value as? Bool {
      try container.encode(value)
    } else if let value = value as? Int64 {
      try container.encode(value)
    } else if let value = value as? Double {
      try container.encode(value)
    } else if let value = value as? String {
      try container.encode(value)
    } else if value is JSONNull {
      try container.encodeNil()
    } else {
      throw encodingError(forValue: value, codingPath: container.codingPath)
    }
  }
  
  public required init(from decoder: Decoder) throws {
    if var arrayContainer = try? decoder.unkeyedContainer() {
      self.value = try JSONAny.decodeArray(from: &arrayContainer)
    } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
      self.value = try JSONAny.decodeDictionary(from: &container)
    } else {
      let container = try decoder.singleValueContainer()
      self.value = try JSONAny.decode(from: container)
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    if let arr = self.value as? [Any] {
      var container = encoder.unkeyedContainer()
      try JSONAny.encode(to: &container, array: arr)
    } else if let dict = self.value as? [String: Any] {
      var container = encoder.container(keyedBy: JSONCodingKey.self)
      try JSONAny.encode(to: &container, dictionary: dict)
    } else {
      var container = encoder.singleValueContainer()
      try JSONAny.encode(to: &container, value: self.value)
    }
  }
}
