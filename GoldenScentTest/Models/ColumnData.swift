//
//  ColumnData.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import Foundation

enum ColumnType: String, Decodable {
    case text = "text"
    case image = "image"
    case slider = "custom-slider"
}


struct ColumnData: Decodable {
    let type: ColumnType
    let src: String?
    let slides: [SliderData]?
    let content: String?
    let textAlignment: String?
    let fontColor: String?
    let fontSize: String?
    let font: String?
    let background: [String: String]?
    
    private enum CodingKeys: String, CodingKey {
        case type, src, content
        case textAlignment = "text-align"
        case fontColor = "font-color"
        case fontSize = "font-size"
        case font, background, slides
    }
}
