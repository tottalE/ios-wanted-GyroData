//
//  ViewController.swift
//  GyroData
//
//  Created by kjs on 2022/09/16.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Constant {
        static let navigationTitle = "목록"
        static let navigationRightButtonTitle = "측정"
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
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
}
