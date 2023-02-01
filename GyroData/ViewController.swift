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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationItem()
        configureNavigationBar()
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
}

