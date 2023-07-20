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
    
    private func createImageViewWithUrl(_ url: URL?, frame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: frame)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: url)
        return imageView
    }
    
    private func createLableViewFor(_ column: ColumnData, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.textColor = column.getFontColor()
        label.font = column.getFont()
        label.text = column.content
        label.backgroundColor = column.getBackgroundColor()
        return label
    }
}

extension DashboardTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isShowingSliderData {
            return rowData?.columns.first?.slides?.count ?? 0
        }
        return rowData?.columns.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        
        //Using same collectionview to show slide data
        if isShowingSliderData {
            guard let colunm = rowData?.columns.first,
                  let sliderData = colunm.slides?[indexPath.item],
                  let imageUrl = URL(string: sliderData.src)
            else { return cell }
            
            let imageView = createImageViewWithUrl(imageUrl, frame: cell.contentView.bounds)
            cell.contentView.addSubview(imageView)
            return cell
        }
        
        
        guard let column = rowData?.columns[indexPath.item]
        else { return cell }
        
        switch column.type {
        case .text:
            // Implement text view with the specified properties
            let label = createLableViewFor(column, frame: cell.contentView.frame)
            cell.contentView.backgroundColor = column.getBackgroundColor()
            cell.contentView.addSubview(label)
            
        case .image:
            // Implement image view with the specified properties
            let imageView = createImageViewWithUrl(column.getImageURL(), frame: cell.contentView.bounds)
            cell.contentView.addSubview(imageView)
            
        case .slider:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isShowingSliderData {
            didSelectCell?(rowData?.columns.first)
        }else {
            didSelectCell?(rowData?.columns[indexPath.item])
        }
    }
}

extension DashboardTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.bounds.width*0.6, height: collectionView.bounds.height)
    }
}
