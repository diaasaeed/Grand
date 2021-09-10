//
//  CategoryHomeTableViewCell.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit

class CategoryHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()

        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        categoryCollection.register(UINib(nibName: ConstantCellID.shared.CategoryHomeCell, bundle: nil), forCellWithReuseIdentifier: ConstantCellID.shared.CategoryHomeCell)
    }


}

extension CategoryHomeTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.categoryCollection.dequeueReusableCell(withReuseIdentifier: ConstantCellID.shared.CategoryHomeCell, for: indexPath) as! CategoryHomeCell
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (UIScreen.main.bounds.width) > 500 {
            return CGSize(width: (UIScreen.main.bounds.width-20)/3, height: CGFloat(50))
        }else{
            return CGSize(width: (UIScreen.main.bounds.width-20)/2, height: CGFloat(50))

        }
    }
        
    
    
    
}
