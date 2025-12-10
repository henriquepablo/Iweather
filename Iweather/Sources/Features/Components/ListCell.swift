//
//  ListCell.swift
//  Iweather
//
//  Created by pablo henrique on 07/12/25.
//

import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    static let identifier = "ListCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.textMD
        label.textColor = Colors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = Colors.gray500
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
