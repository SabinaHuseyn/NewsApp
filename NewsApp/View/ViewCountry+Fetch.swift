//
//  ViewCountry+Fetch.swift
//  NewsApp
//
//  Created by Sabina Huseynova on 27.09.21.
//

import Foundation
import UIKit

extension ViewController {
    
    func fetchCountry(country: String) {
        countrySearched = true
        categorySearched = false
        sourcesSearched = false
        searchbarSearched = false
        publishedDateSearched = false
        let queryParams: [URLQueryItem] = [
            URLQueryItem(name: "country", value: country),
            URLQueryItem(name: "apiKey", value: API.apiKey),
        ]
        Service.shared.fetchNewsForTableview(query: queryParams) { news in
            return DispatchQueue.main.async {
                self.articlesCountryViewModels = news.map({return ArticlesFilterViewModel(articlesFilterModel: $0)})
                self.mainTableView.reloadData()
                self.refreshControl.endRefreshing()
                
            }
            
        }
    }
    
    func fetchSource(source: String) {
        countrySearched = false
        categorySearched = false
        sourcesSearched = true
        searchbarSearched = false
        publishedDateSearched = false
        let queryParams: [URLQueryItem] = [
            URLQueryItem(name: "sources", value: source),
            URLQueryItem(name: "apiKey", value: API.apiKey),
        ]
        Service.shared.fetchNewsForTableview(query: queryParams) { news in
            DispatchQueue.main.async {
                self.articlesSourcesViewModels = news.map({return ArticlesFilterViewModel(articlesFilterModel: $0)})
                self.mainTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func fetchCategory(category: String) {
        countrySearched = false
        categorySearched = true
        sourcesSearched = false
        searchbarSearched = false
        publishedDateSearched = false
        let queryParams: [URLQueryItem] = [
            URLQueryItem(name: "category", value: category),
            URLQueryItem(name: "apiKey", value: API.apiKey),
        ]
        Service.shared.fetchNewsForTableview(query: queryParams) { news in
            DispatchQueue.main.async {
                self.articlesCategoryViewModels = news.map({return ArticlesFilterViewModel(articlesFilterModel: $0)})
                self.mainTableView.reloadData()
                self.refreshControl.endRefreshing()
                
            }
        }
    }
}
