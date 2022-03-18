//
//  MainTableViewCell.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    private let stackView = UIStackView()
    private let nameLabel = UILabel()
    private let quantityLabel = UILabel()
    
    static let reuseId = "mainCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String?, quantity: String?) {
        nameLabel.text = name
        quantityLabel.text = quantity
    }
}

private extension MainTableViewCell {
    func setupItems() {
        backgroundColor = .lightGray
        setupStackView()
        setupNameLabel()
        setupQuantityLabel()
    }
    
    func setupStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(quantityLabel)
    }
    
    func setupNameLabel() {
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
    }
    
    func setupQuantityLabel() {
        quantityLabel.textColor = .black
        quantityLabel.textAlignment = .right
    }
}
