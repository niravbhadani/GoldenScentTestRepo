//
//  DashboardTableViewCell.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import Foundation
import SDWebImage


class DashboardTableCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionLeftMargin: NSLayoutConstraint!
    @IBOutlet weak var collectionRightMargin: NSLayoutConstraint!
    @IBOutlet weak var collectionBottomMargin: NSLayoutConstraint!
    
    
    //MARK: Variables
    var rowData: RowData? {
        didSet {
            updateCellView()
        }
    }
    var didSelectCell:((ColumnData?) -> ())?
    private var isShowingSliderData: Bool = false

    
    //MARK: Initial Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
    }
    
    
    //MARK: Methods
    private func updateCellView() {
        guard let rowData = rowData
        else { return }
        
        if let leftMargin = rowData.marginLeft {
            collectionLeftMargin.constant = rowData.getFlotFromString(leftMargin) ?? 20
        }
        
        if let rightMargin = rowData.marginRight {
            collectionRightMargin.constant = rowData.getFlotFromString(rightMargin) ?? 20
        }
        
        if let bottomMargin = rowData.marginBottom {
            collectionBottomMargin.constant = rowData.getFlotFromString(bottomMargin) ?? 20
        }
        
        if rowData.columns.first?.type == .slider {
            isShowingSliderData = true
        }else {
            isShowingSliderData = false
        }
        
        collectionView.reloadData()
    }

}
