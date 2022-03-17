//
//  CreateViewController.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

class CreateViewController: UIViewController {
    
    private var createModel: CreateViewModel?
    private let taskView = TaskView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
    
    func configure(createModel: CreateViewModel) {
        self.createModel = createModel
    }
}

extension CreateViewController {
    func setupItems() {
        view.backgroundColor = .systemMint
        setupTaskView()
    }
    
    func setupTaskView() {
        view.addSubview(taskView)
        taskView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskView.topAnchor.constraint(equalTo: view.topAnchor),
            taskView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        taskView.onButtonTap = { [ weak self ] (nameField, quantityField) in
            self?.createModel?.saveItem(nameField: nameField, quantityField: quantityField)
        }
    }
}
