//
//  MotionDataTableViewCell.swift
//  GyroData
//
//  Created by jin on 2/1/23.
//

import UIKit

class MotionDataTableViewCell: UITableViewCell {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().customBodyFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let motionTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().customTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let motionDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().customLargeTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func configureUI() {
        configureConstraints()
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(motionTypeLabel)
        addSubview(stackView)
        addSubview(motionDataLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: motionDataLabel.widthAnchor, multiplier: 3),
            contentView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            motionDataLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            motionDataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
