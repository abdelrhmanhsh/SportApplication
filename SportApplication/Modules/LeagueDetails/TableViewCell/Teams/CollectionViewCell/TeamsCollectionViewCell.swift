//
//  TeamsCollectionViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    static let identifier = "TeamsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    // set team image
    func displayTeamImage(strTeamBadge: String) {
        teamImage.kf.setImage(with: URL(string: strTeamBadge), placeholder: UIImage(named: "placeholder.jpeg"), options: nil, progressBlock: nil, completionHandler: nil)
    }
    
    // set team name
    func displayTeamName(strTeam: String) {
        teamName.text = strTeam
    }
    
}