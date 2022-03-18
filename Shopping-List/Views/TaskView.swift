//
//  TaskView.swift
//  Shopping-List
//
//  Created by ineta.magone on 16/03/2022.
//

import UIKit

final class TaskView: UIView {
    
    private let verticalStack = UIStackView()
    private let horizontalDescriptionStack = UIStackView()
    private let horizontalStack = UIStackView()
    private let viewTitle = UILabel()
    private let nameFieldDescription = UILabel()
    private let quantityFieldDescription = UILabel()
    private let nameField = UITextField()
    private let quantityField = UITextField()
    private let button = UIButton()
    
    var onButtonTap: ((String?, String?) -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String? = nil, quantity: String? = nil) {
        nameField.text = name
        quantityField.text = quantity
    }
    
    func configureViewTitle(viewTitle: String) {
        self.viewTitle.text = viewTitle
    }
}

private extension TaskView {
    
    func setupItems() {
        setupVerticalStack()
        setupViewTitle()
        setupHorizontalDecsriptionStack()
        setupHorizontalStack()
        setupButton()
        setupNameDescriptionField()
        setupQuantityDescriptionField()
        setupNameField()
        setupQuantityField()
    }
    
    func setupVerticalStack() {
        addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 120),
        ])
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.spacing = 5
        verticalStack.addArrangedSubview(viewTitle)
        verticalStack.addArrangedSubview(horizontalDescriptionStack)
        verticalStack.addArrangedSubview(horizontalStack)
    }
    
    func setupViewTitle() {
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewTitle.heightAnchor.constraint(equalToConstant: 60),
        ])
        viewTitle.font = UIFont(name: "Copperplate-Bold", size: 24)
        viewTitle.textAlignment = .center
    }
    
    func setupHorizontalDecsriptionStack() {
        horizontalDescriptionStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalDescriptionStack.heightAnchor.constraint(equalToConstant: 40),
        ])
        horizontalDescriptionStack.axis = .horizontal
        horizontalDescriptionStack.distribution = .fill
        horizontalDescriptionStack.spacing = 1
        horizontalDescriptionStack.addArrangedSubview(nameFieldDescription)
        horizontalDescriptionStack.addArrangedSubview(quantityFieldDescription)
    }
    
    func setupHorizontalStack() {
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStack.heightAnchor.constraint(equalToConstant: 40),
        ])
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 1
        horizontalStack.addArrangedSubview(nameField)
        horizontalStack.addArrangedSubview(quantityField)
    }
    
    func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 80),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
        ])
        button.backgroundColor = .lightGray
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func setupNameDescriptionField() {
        nameFieldDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameFieldDescription.widthAnchor.constraint(equalTo: horizontalDescriptionStack.widthAnchor, multiplier: 0.8)
        ])
        nameFieldDescription.text = "Shopping Item"
        nameFieldDescription.font = UIFont(name: "Copperplate-Bold", size: 20)
        nameFieldDescription.textColor = .black
        nameFieldDescription.textAlignment = .center
        nameFieldDescription.backgroundColor = .lightGray
    }
    
    func setupQuantityDescriptionField() {
        quantityFieldDescription.text = "Qty"
        quantityFieldDescription.font = UIFont(name: "Copperplate-Bold", size: 20)
        quantityFieldDescription.textColor = .black
        quantityFieldDescription.textAlignment = .center
        quantityFieldDescription.backgroundColor = .lightGray
    }
    
    func setupNameField() {
        nameField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameField.widthAnchor.constraint(equalTo: horizontalStack.widthAnchor, multiplier: 0.8)
        ])
        nameField.placeholder = "Ex. Carrots.."
        nameField.font = UIFont(name: "Copperplate-Light", size: 20)
        nameField.textColor = .black
        nameField.textAlignment = .center
        nameField.backgroundColor = .white
    }
    
    func setupQuantityField() {
        quantityField.placeholder = "2"
        quantityField.font = UIFont(name: "Copperplate-Light", size: 20)
        quantityField.textColor = .black
        quantityField.textAlignment = .center
        quantityField.backgroundColor = .white
    }
    
    @objc func didTapButton() {
        onButtonTap?(nameField.text, quantityField.text)
    }
}
