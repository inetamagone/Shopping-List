//
//  EditViewController.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

class EditViewController: UIViewController {

    private var editModel: EditViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    func configure(editModel: EditViewModel) {
        self.editModel = editModel
    }
    
}
