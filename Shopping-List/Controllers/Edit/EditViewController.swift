//
//  EditViewController.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

class EditViewController: UIViewController {

    private var editModel: EditViewModel?
    private let taskView = TaskView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
    
    func configure(editModel: EditViewModel) {
        self.editModel = editModel
    }
}

private extension EditViewController {
    func setupItems() {
        view.backgroundColor = .yellow
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
        taskView.configure(name: editModel?.item?.name, quantity: editModel?.item?.quantity)
        taskView.configureViewTitle(viewTitle: "Edit the Shopping Item")
        taskView.onButtonTap = { [weak self] (nameText, quantity) in
            if nameText != "" && quantity != "" {
                self?.editModel?.editItem(name: nameText, quantity: quantity ?? "")
            }
        }
    }
}
