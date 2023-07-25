//
//  DetailViewController.swift
//  MVP.Router.Assemply.Tests
//
//  Created by admin on 25.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    var presenter : DetailPresenterProtocol?
    
    @IBOutlet weak var CommetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setComment()
    }

    @IBAction func BackButtonAction(_ sender: Any) {
        presenter?.getBack()
    }
}

    extension DetailViewController: DetailViewProtocol {
        func setComment(comment: Comment?) {
            self.CommetLabel.text = comment?.body
        }
    }
