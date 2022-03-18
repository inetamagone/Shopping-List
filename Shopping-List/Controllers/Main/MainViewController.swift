//
//  MainViewController.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

class MainViewController: UIViewController {

    private var mainModel: MainViewModel?
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
    
    func configure(mainModel: MainViewModel) {
        self.mainModel = mainModel
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

private extension MainViewController {
    func setupItems() {
        setNavBar()
        setTableView()
    }
    
    func setNavBar() {
        self.navigationController?.navigationBar.backgroundColor = UIColor.secondarySystemBackground
        self.navigationItem.title = "My Shopping List"
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addItem))
        addItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = addItem
        let trashItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(deleteItem))
        trashItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = trashItem
    }
    
    func setTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        tableView.backgroundColor = .systemMint
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func addItem() {
        mainModel?.createItem()
    }
    
    @objc func deleteItem() {
        
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModel?.getItemCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath) as? MainTableViewCell else { fatalError() }
        let item = mainModel?.getItem(at: indexPath)
        cell.configure(name: item?.name, quantity: item?.quantity)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainModel?.editItem(at: indexPath)
    }
}
