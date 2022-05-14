//
//  LeaguesViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 14/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher


class LeaguesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
  
   var sportName="Soccer"
    var flag = "all"
    var leaguesList:[LeaguesModel] = []
    var leaguesPresenter:LeaguesProtocol?
    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesPresenter = LeaguesPresenter()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
        let myUrl = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s="
        leaguesPresenter?.getLeagues(parameters: sportName ,url: myUrl, completionHandler: { [weak self] leagues, error in
            print("Completion handler ")
            if let error = error {
                print(error)
            } else {
                guard let resualt = leagues else { return }
                self?.leaguesList = resualt.countries ?? []
                self!.tableView.reloadData()
                print(resualt)
                
               
            }
        })

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesList.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        cell.title.text = leaguesList[indexPath.row].strLeague
        let image:UIImage = UIImage(named: "youtube.png")!
        cell.youtubeImage.setBackgroundImage(image, for: UIControl.State.normal)
        if leaguesList[indexPath.row].strYoutube == ""{
            
//            cell.youtubeImage.isUserInteractionEnabled = false
//            let blur = UIVisualEffectView(effect: UIBlurEffect(style:
//                        UIBlurEffect.Style.light))
//            blur.frame = cell.youtubeImage.bounds
//            blur.isUserInteractionEnabled = false //This allows touches to forward to the button.
//            cell.youtubeImage.insertSubview(blur, at: 0)

            
        }else{
            cell.youtubeLink = leaguesList[indexPath.row].strYoutube ?? ""
        }
        
       let url = leaguesList[indexPath.row].strBadge
        cell.logoImage.kf.setImage(with: URL(string: url!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)

            
        
       return cell
    }
      

    func showAlert(){
       let alert : UIAlertController = UIAlertController(title: "warning", message: "Sorry but this League has no video on Youtube", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
 
}