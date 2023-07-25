//
//  DetailPresenter.swift
//  MVP.Router.Assemply.Tests
//
//  Created by admin on 25.07.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailPresenterProtocol: AnyObject {
    
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func getBack()
}

class DetailPresenter: DetailPresenterProtocol {
    
    var comment: Comment?
    var router: RouterProtocol?
    weak var view: DetailViewProtocol?
    let networkService : NetworkServiceProtocol!

    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.router = router
        self.view = view
        self.networkService = networkService
        self.comment = comment
    }
    
    func setComment() {
        self.view?.setComment(comment: self.comment)
    }
    
    func getBack() {
        self.router?.popToRoot()
    }

}
