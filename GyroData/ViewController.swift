//
//  ViewController.swift
//  GyroData
//
//  Created by kjs on 2022/09/16.
//

import UIKit

final class ViewController: UIViewController {
    
    private enum Constant {
        static let navigationTitle = "목록"
        static let navigationRightButtonTitle = "측정"
    }
    
    enum Section {
        case main
    }
    
    var motionDataList: [MotionData] = [MotionData(id: UUID(), type: .gyro, motions: [Motion(x: 1, y: 1, z: 1)], date: Date(), time: 10)] {
        didSet {
            applySnapShot()
        }
    }
    var dataSource: UITableViewDiffableDataSource<Section, MotionData>?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        configureTableView()
    }
    
    private func configureUI() {
        configureNavigationItem()
        configureNavigationBar()
        configureHierarchy()
        configureLayout()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.topItem?.title = Constant.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont().customTitleFont]
    }
    
    private func configureNavigationItem() {
        let rightButtonItem = UIBarButtonItem(
            title: Constant.navigationRightButtonTitle,
            style: .plain,
            target: self,
            action: nil
        )
        rightButtonItem.setTitleTextAttributes(
            [.font: UIFont().customTitleFont],
            for: .normal
        )
        navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    private func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureTableView() {
        dataSource = UITableViewDiffableDataSource<Section, MotionData>(
            tableView: tableView,
            cellProvider: { tableView, _, motionData  in
            let cell = tableView.dequeueReusableCell(withIdentifier: MotionDataTableViewCell.cellIdentifier) as? MotionDataTableViewCell
            cell?.motionData = motionData
            return cell
        })
        tableView.dataSource = dataSource
        tableView.register(MotionDataTableViewCell.self, forCellReuseIdentifier: MotionDataTableViewCell.cellIdentifier)
    }
}

extension ViewController {
    private func applySnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MotionData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(motionDataList)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
