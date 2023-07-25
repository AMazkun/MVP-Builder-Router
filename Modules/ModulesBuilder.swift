//
//  ModuleBuilder.swift
//  MVP.Router.Assemply.Tests
//
//  Created by admin on 25.07.2023.
//

import UIKit

protocol Builder {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(router: RouterProtocol, comment: Comment?) -> UIViewController
}

class ModulesBuilder: Builder {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let networkService = NetworService()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createDetailModule(router: RouterProtocol, comment: Comment?) -> UIViewController {
        let networkService = NetworService()
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router, comment: comment)
        view.presenter = presenter
        
        return view
    }
    
}
