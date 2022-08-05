//
//  MainViewModel.swift
//  Netmate
//
//  Created by GiN Eugene on 5/8/2022.
//

import Foundation

protocol MainViewModelInputProtocol {
    func addToFavoriteFeed(_ feed: Feed, _ user: User, completition: @escaping (String?) -> Void)
}

class MainViewModel: MainViewModelInputProtocol {
    func addToFavoriteFeed(_ feed: Feed, _ user: User, completition: @escaping (String?) -> Void) {
        DataBaseManager.shared.addFeed(feed, user) { message in
            DispatchQueue.main.async {
                completition(message)
            }
        }
    }
}
