//
//  Router.swift
//  MVP.Router.Assemply.Tests
//
//  Created by admin on 25.07.2023.
//

import Foundation
import UIKit

protocol RouterAbstract {
    var navigationController :  UINavigationController? {get set}
    var moduleBuilder:          ModulesBuilder? {get set}
}

protocol RouterProtocol: RouterAbstract {
    func initalViewController()
    func showDetail(comment: Comment)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var moduleBuilder: ModulesBuilder?
    
    init(navigationController: UINavigationController, moduleBuilder : ModulesBuilder) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
        
        initalViewController()
    }

    func initalViewController() {
        if let navigationController = navigationController,
           let mainViewController = moduleBuilder?.createMainModule(router: self) {
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetail(comment: Comment) {
        if let navigationController = navigationController,
           let detailedViewController = moduleBuilder?.createDetailModule(router: self, comment: comment) {
            navigationController.pushViewController(detailedViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
