//
//  HomeViewController.swift
//  Recipes
//
//  Created by bartlomiej.guz on 04/08/2019.
//  Copyright © 2019 bartlomiej.guz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.inputs.viewWillAppear()
    }
    
    // Maybe it would be possible to inject already configured view model from outside.
    // See here: https://useyourloaf.com/blog/better-storyboards-with-xcode-11/?fbclid=IwAR3zd3_M2gqDT6jI7Xb-YnFsjat2RI5T24vdWIHr6M-mITD7TrnGpHUZzEg
    private func setupViewModel() {
        viewModel = HomeViewModel(provider: DummyHomeMealItemsProvider())
        
        viewModel.outputs.items.bind(to: tableView.rx.items(cellIdentifier: cellReuseID)) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.detailTextLabel?.text = model.overview
        }.disposed(by: bag)
    }
    
    private var viewModel: HomeViewModelDef!
    private var bag = DisposeBag()
    
    private let cellReuseID = "HomeCellID"
}
