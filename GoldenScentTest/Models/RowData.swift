//
//  RowData.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import Foundation


struct RowData: Decodable {
    let marginLeft: String?
    let marginRight: String?
    let marginBottom: String?
    let height: String?
    let columns: [ColumnData]
    
    private enum CodingKeys: String, CodingKey {
        case marginLeft = "row-margin-left"
        case marginRight = "row-margin-right"
        case marginBottom = "row-margin-bottom"
        case height, columns
    }
}
