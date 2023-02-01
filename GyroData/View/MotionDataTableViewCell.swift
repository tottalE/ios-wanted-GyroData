//
//  MotionDataTableViewCell.swift
//  GyroData
//
//  Created by jin on 2/1/23.
//

import UIKit

class MotionDataTableViewCell: UITableViewCell {
    
    private enum Constant {
        static let timeLabelWidth: CGFloat = 70.4
        static let verticalStackViewMultipler: CGFloat = 3
    }
    
    static let cellIdentifier = String.init(describing: MotionDataTableViewCell.self)
    
    var motionData: MotionData? {
        didSet {
            configureData()
        }
    }
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let dateLabel: UILabel = {
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
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont().customLargeTitleFont
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierarchy() {
        verticalStackView.addArrangedSubview(dateLabel)
        verticalStackView.addArrangedSubview(motionTypeLabel)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(timeLabel)
        addSubview(horizontalStackView)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            timeLabel.widthAnchor.constraint(equalToConstant: Constant.timeLabelWidth),
            verticalStackView.widthAnchor.constraint(equalTo: timeLabel.widthAnchor, multiplier: Constant.verticalStackViewMultipler),
            horizontalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            horizontalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configureData() {
        dateLabel.text = motionData?.date.description
        motionTypeLabel.text = motionData?.type.rawValue
        timeLabel.text = motionData?.time.description
    }
}
