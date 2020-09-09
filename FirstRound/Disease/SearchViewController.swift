//
//  SearchViewController.swift
//  FirstRound
//
//  Created by Zuhur M on 16.05.2020.
//  Copyright © 2020 Zuhur M. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    var model = BoleznModel()
    var diseases = BoleznModel().diseases
     let idCell = "docCell"

       
    
    
       private var filteredDiseas = [Disease]()
       private var filteredType = [Disease]()
       let searchController = UISearchController(searchResultsController: nil)
       private var searchBarIsEmpty:Bool{
           guard let text = searchController.searchBar.text else{return  false}
           return text.isEmpty
       }
       private var isFiltering:Bool{
           let searchBarScopeisFilteren = searchController.searchBar.selectedScopeButtonIndex != 0
           return searchController.isActive && (!searchBarIsEmpty || searchBarScopeisFilteren)
       }
    
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.dataSource = self
             tableView.delegate = self
             searchController.searchResultsUpdater = self
             searchController.obscuresBackgroundDuringPresentation = false
             searchController.searchBar.placeholder = "Searching"
             navigationItem.searchController = searchController
             definesPresentationContext = true
             
             //setup scope bar
             searchController.searchBar.scopeButtonTitles = ["Болезнь","Симптом"]
             searchController.searchBar.delegate = self
        
        
    }
    

}



extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredDiseas.count
        
        }
        return diseases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! CustomTableViewCell
        
        var disea:Disease
        if isFiltering{
            disea = filteredDiseas[indexPath.row]
        }else {
            disea = diseases[indexPath.row]
        }

        cell.titleLabel.text = disea.name
        cell.subtitleLabel.text = disea.type
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "showDetail" {
              if let indexPath = tableView.indexPathForSelectedRow {
                
                let disea:Disease
               if isFiltering{
                disea = filteredDiseas[indexPath.row]
               }else{
                disea = diseases[indexPath.row]
                }
                  let detailVC = segue.destination as! DetailViewController
                detailVC.diseases = disea
              }
          }
      }
    
}
extension SearchViewController:UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    private func filterContentForSearchText(_ searchText:String, scope: String = "Болезнь"){
        filteredDiseas = diseases.filter({ (disea:Disease) -> Bool in
        
              let doesCategoryMatch = (scope == "Болезнь")  || (scope == "Симптом") || (disea.type == scope)
            
            if searchBarIsEmpty{
                return doesCategoryMatch
            }
            if scope == "Болезнь"{
                
            return disea.name.lowercased().contains(searchText.lowercased())
                
            }
            return disea.type.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
//UISearchcontroller Scope Bar Delegate
extension SearchViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!,scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
