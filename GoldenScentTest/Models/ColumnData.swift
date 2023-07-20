//
//  ColumnData.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import UIKit

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
    
    //MARK: Methods
    func getImageURL() -> URL? {
        guard let urlStr = src
        else {
            return nil
        }
    
        return URL(string: urlStr)
    }
    
    func getTextAlignment() -> NSTextAlignment {
        guard let alignment = textAlignment
        else {
            return .natural
        }
        
        switch alignment {
        case "letf":
            return .left
        case "right":
            return .right
        case "center":
            return .center
        default:
            return.natural
        }
    }
    
    func getFont() -> UIFont {
        guard let fontName = font,
              let fontSize = fontSize
        else {
            return .systemFont(ofSize: 13)
        }
        
        let font = UIFont(name: fontName, size: fontSize.convetToCGFlot() ?? 13)
        return font ?? .systemFont(ofSize: 13)
    }
    
    func getFontColor() -> UIColor {
        guard let fontColor = fontColor
        else { return .black }
        
        return fontColor.convertToUIColor() ?? .black
    }
    
    func getBackgroundColor() -> UIColor {
        guard let backgroundDict = background,
              let colorString = backgroundDict["color"]
        else {
            return .white
        }
        
        return colorString.convertToUIColor() ?? .white
    }
}
