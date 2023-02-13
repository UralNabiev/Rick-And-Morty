//
//  HomeVC.swift
//  RickAndMorty
//
//  Created by O'ral Nabiyev on 16/01/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class HomeVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var charactersArr: [CharacterDM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func setUpTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterTVC.nib(), forCellReuseIdentifier: CharacterTVC.identifier)
    }
    
    
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoVC(nibName: "InfoVC", bundle: nil)
        vc.url = self.charactersArr[indexPath.item].url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTVC.identifier, for: indexPath) as? CharacterTVC else {return UITableViewCell()}
        
        cell.updateCell(data: charactersArr[indexPath.item])
        
        return cell
    }
    
}

//MARK: - getCharacter
extension HomeVC {
   
    func getData() {
        API.getCharacter { data in
            guard let data = data else { return }
            self.charactersArr = data
            self.setUpTableView()
            self.tableView.reloadData()
        }
    }
    
}
