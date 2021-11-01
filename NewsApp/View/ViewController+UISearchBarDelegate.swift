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
        searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.loadViewIfNeeded()
        definesPresentationContext = true
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let noOffset = UIOffset(horizontal: 0, vertical: 0)
        searchBar.setPositionAdjustment(noOffset, for: .search)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setPositionAdjustment(offset, for: .search)
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if var searchTxt = articlesSearchViewModels {
            guard searchTxt.count > 0 else {return}
            searchTxt.removeAll()
        }
        guard let textToSearch = searchBar.text?.lowercased(), !textToSearch.isEmpty else {
            return
        }
            textSearchChange(textToSearch)
    }
    
    func textSearchChange(_ sender: String) {
        countrySearched = false
        categorySearched = false
        sourcesSearched = false
        searchbarSearched = true
        publishedDateSearched = false
        let queryParams: [URLQueryItem] = [
            URLQueryItem(name: "q", value: sender),
            URLQueryItem(name: "apiKey", value: API.apiKey),
        ]
        Service.shared.fetchNewsForTableview(query: queryParams){ news in
            return DispatchQueue.main.async {
                self.articlesSearchViewModels = news.map({return ArticlesFilterViewModel(articlesFilterModel: $0)})
                self.mainTableView.reloadData()
                self.refreshControl.endRefreshing()
                
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        articlesSearchViewModels?.removeAll()
    }
}
