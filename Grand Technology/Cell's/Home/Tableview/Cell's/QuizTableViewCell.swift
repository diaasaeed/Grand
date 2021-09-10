//
//  QuizTableViewCell.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var quizeCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quizeCollectionView.delegate = self
        quizeCollectionView.dataSource = self
        
        quizeCollectionView.register(UINib(nibName: ConstantCellID.shared.GamesCell, bundle: nil), forCellWithReuseIdentifier: ConstantCellID.shared.GamesCell)
        

    }

 
}


extension QuizTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = quizeCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantCellID.shared.GamesCell, for: indexPath) as! GamesCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(130), height:  CGFloat(150))
    }
    
}
