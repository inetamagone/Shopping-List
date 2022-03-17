//
//  CreateViewController.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

class CreateViewController: UIViewController {

    private var createModel: CreateViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    func configure(createModel: CreateViewModel) {
        self.createModel = createModel
    }
}
