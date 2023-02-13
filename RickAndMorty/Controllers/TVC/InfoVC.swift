//
//  InfoVC.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 13/02/23.
//

import UIKit
import SDWebImage

class InfoVC: UIViewController {
    
    @IBOutlet weak var imgCharacter: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var statusColorV: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var firstSeenLbl: UILabel!
    
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
    }

}


extension InfoVC {
    
    func getInfo() {
        API.getCharacterInfo(url: url) { data in
            guard let data = data else { return }
            self.imgCharacter.sd_setImage(with: URL(string: data.imgCharacter))
            self.nameLbl.text = data.name
            self.locationLbl.text = data.lastLocation
            self.firstSeenLbl.text = data.firstSeen
            if data.statusCharacter == "Dead" {
                self.statusColorV.backgroundColor = .red
            } else if data.statusCharacter == "Alive" {
                self.statusColorV.backgroundColor = .green
            } else {
                self.statusColorV.backgroundColor = .gray
            }
        }
    }
    
}
