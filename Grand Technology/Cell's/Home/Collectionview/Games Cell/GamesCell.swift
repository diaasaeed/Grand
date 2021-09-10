//
//  GamesCell.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit

class GamesCell: UICollectionViewCell {

    @IBOutlet weak var imageGame: UIImageView!
    @IBOutlet weak var nameGameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageGame.image = #imageLiteral(resourceName: "candy")
    }

}
