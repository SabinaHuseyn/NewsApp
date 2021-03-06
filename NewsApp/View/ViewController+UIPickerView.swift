//
//  ViewController+UIPickerView.swift
//  NewsApp
//
//  Created by Sabina Huseynova on 28.09.21.
//

import Foundation
import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
            
        case countryPickerView:
            return newsCountry.count
        case categoryPickerView:
            return newsCategory.count
        case sourcePickerView:
            return newsSource.count
        default:
            break
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        switch pickerView {
        case countryPickerView:
            return NSAttributedString(string: newsCountry[row].country, attributes: [NSAttributedString.Key.foregroundColor: UIColor.textBlue])
        case categoryPickerView:
            return NSAttributedString(string: newsCategory[row].category, attributes: [NSAttributedString.Key.foregroundColor: UIColor.textBlue])
        case sourcePickerView:
            return NSAttributedString(string: newsSource[row].name, attributes: [NSAttributedString.Key.foregroundColor: UIColor.textBlue])
        default:
            break
        }
        return NSAttributedString(string: "Data")
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case countryPickerView:
            fetchCountry(country: newsCountry[row].country)
            btnCountry.setTitle(newsCountry[row].country, for: .normal)
            btnCountry.setImage(nil, for: .normal)
            btnCountry.contentHorizontalAlignment = .center
            btnCategory.setBtn("Category")
            btnSource.setBtn("Source")
            countryPickerView.isHidden = true
        case categoryPickerView:
            fetchCategory(category: newsCategory[row].category)
            btnCategory.setTitle(newsCategory[row].category, for: .normal)
            btnCategory.setImage(nil, for: .normal)
            btnCategory.contentHorizontalAlignment = .center
            btnCountry.setBtn("Country")
            btnSource.setBtn("Source")
            categoryPickerView.isHidden = true
        case sourcePickerView:
            fetchSource(source: newsSource[row].id)
            btnSource.setTitle(newsSource[row].id, for: .normal)
            btnSource.setImage(nil, for: .normal)
            btnSource.contentHorizontalAlignment = .center
            btnCategory.setBtn("Category")
            btnCountry.setBtn("Country")
            sourcePickerView.isHidden = true
        default:
            break
        }
    }
}
