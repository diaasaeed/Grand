//
//  ExploreVC.swift
//  Grand Technology
//
//  Created by almotaz on 9/9/21.
//

import UIKit
import AnimatableReload

class ExploreVC: UIViewController {

    //MARK:- outlet
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

     }
     
}

//MARK:- tableview
extension ExploreVC:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantCellID.shared.SliderTableViewCell, for: indexPath) as! SliderTableViewCell
            AnimatableReload.reload(collectionView: cell.sliderCollectionView, animationDirection: "right")

             return cell
            
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantCellID.shared.EventsTableViewCell, for: indexPath) as! EventsTableViewCell
            AnimatableReload.reload(collectionView: cell.eventCollectionView, animationDirection: "right")

            return cell
            
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantCellID.shared.GamesTableViewCell, for: indexPath) as! GamesTableViewCell
            AnimatableReload.reload(collectionView: cell.gamesCollectioView, animationDirection: "right")

            return cell
            
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantCellID.shared.GamesTableViewCell, for: indexPath) as! GamesTableViewCell
            AnimatableReload.reload(collectionView: cell.gamesCollectioView, animationDirection: "right")

            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ConstantCellID.shared.CategoryHomeTableViewCell, for: indexPath) as! CategoryHomeTableViewCell
            AnimatableReload.reload(collectionView: cell.categoryCollection, animationDirection: "right")

            return cell
        }
  
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 100
        }else if indexPath.row == 1{
            return 280
        }else if indexPath.row == 2 {
            return 180
        }else if indexPath.row == 3{
            return 180
        }else {
            return 300
        }
        
    }

}
