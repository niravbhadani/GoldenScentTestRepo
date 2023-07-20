//
//  DashboardTableViewModel.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import Foundation


final class DashboardTableViewModel {
    
    //MARK: Variables
    private var rowData: [RowData] = []

    
    //MARK: Initial Methods
    init(jsonString: String) {
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let dictData = try JSONDecoder().decode(Dictionary<String, [RowData]>.self, from: jsonData)
                rowData = dictData["rows"] ?? []
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
    }

    
    //MARK: Methods
    func numberOfRows() -> Int {
        return rowData.count
    }
    
    func getRowDataForRow(row: Int) -> RowData {
        return rowData[row]
    }
}
