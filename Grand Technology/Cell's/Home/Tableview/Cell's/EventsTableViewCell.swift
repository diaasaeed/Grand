//
//  EventsTableViewCell.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit
import AnimatableReload

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        self.eventCollectionView.delegate = self
        self.eventCollectionView.dataSource = self
        eventCollectionView.register(UINib(nibName: ConstantCellID.shared.EventCell, bundle: nil), forCellWithReuseIdentifier: ConstantCellID.shared.EventCell)

    }

 }


extension EventsTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = eventCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantCellID.shared.EventCell, for: indexPath) as! EventCell
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(175), height:  CGFloat(230))
    }
    
}
