//
//  EventCell.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit

class EventCell: UICollectionViewCell {

    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var mainTitleLable: UILabel!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewCell.static_shadowall()
    }

}
