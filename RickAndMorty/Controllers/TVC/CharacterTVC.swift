//
//  CharacterTVC.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 16/01/23.
//

import UIKit
import SDWebImage

class CharacterTVC: UITableViewCell {

    static func nib() -> UINib {
        UINib(nibName: "CharacterTVC", bundle: nil)
    }
    
    static let identifier: String = "CharacterTVC"
    
    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var statusColor: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var firstSeenLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateCell(data: CharacterDM) {
        
        characterImg.sd_setImage(with: URL(string: data.imgCharacter), placeholderImage: nil)
        nameLbl.text = data.name
        statusLbl.text = data.statusCharacter
        locationLbl.text = data.lastLocation
        firstSeenLbl.text = data.firstSeen
        if data.statusColor == "Dead" {
            statusColor.backgroundColor = .red
        } else if data.statusColor == "Alive" {
            statusColor.backgroundColor = .green
        } else {
            statusColor.backgroundColor = .gray
        }
        
    }
    
}
