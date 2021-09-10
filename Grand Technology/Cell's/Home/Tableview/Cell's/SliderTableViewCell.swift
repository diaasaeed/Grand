//
//  SliderTableViewCell.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit
import AnimatableReload

class SliderTableViewCell: UITableViewCell {

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        sliderCollectionView.register(UINib(nibName: ConstantCellID.shared.SliderCell , bundle: nil), forCellWithReuseIdentifier: ConstantCellID.shared.SliderCell )
        
        AnimatableReload.reload(collectionView: self.sliderCollectionView, animationDirection: "right")

     }

}


extension SliderTableViewCell:UICollectionViewDataSource , UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.sliderCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantCellID.shared.SliderCell, for: indexPath) as! SliderCell
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(250), height:  CGFloat(80))
    }
    
}
