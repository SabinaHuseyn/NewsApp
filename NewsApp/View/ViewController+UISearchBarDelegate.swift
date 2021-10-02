//
//  ViewController+UISearchBarDelegate.swift
//  NewsApp
//
//  Created by Sabina Huseynova on 02.10.21.
//

import Foundation
import UIKit

extension ViewController: UISearchBarDelegate {
    
    func setupSearch() {
        searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.showsCancelButton = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.loadViewIfNeeded()
        definesPresentationContext = true
    }
  
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        articlesSearchViewModels.removeAll()
        guard let textToSearch = searchBar.text?.lowercased(), !textToSearch.isEmpty else {
            return
        }
        
        if Date().timeIntervalSince(previousRun) > minInterval {
            previousRun = Date()
            textSearchChange(textToSearch)
        }
    }
    
    func textSearchChange(_ sender: String) {
        Service.shared.fetchSearch(query: sender) { news in
            self.articlesSearchViewModels = news.map({return ArticlesFilterViewModel(articlesFilterModel: $0)})
            return DispatchQueue.main.async {
                self.mainTableView.reloadData()
                self.refreshControl.endRefreshing()
                
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        articlesSearchViewModels.removeAll()
    }

}
