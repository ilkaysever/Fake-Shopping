//
//  ViewController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - UI Components
    private let tableView: UITableView = UITableView()
    
    // MARK: - Variables
    let viewModel = ProductViewModel()
    var group = DispatchGroup()
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        configureUI()
        configureTableView()
        setupBinding()
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func configureUI() {
        view.addSubview(tableView)
    }
    
    // MARK: - Request
    private func setupBinding() {
        fetchProductList()
    }
    
    private func fetchProductList() {
        group.enter()
        viewModel.productListRequest()
        viewModel.didSuccess = {
            self.group.leave()
        }
        viewModel.didFailure = { errror in
            self.group.leave()
            print(errror)
        }
    }
    
    // MARK: - TableView Configure
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = AppColors.tabBarColor
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ProductTableCell.self)
        DispatchQueue.main.async {
            self.tableView.snp.makeConstraints { make in
                make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
                make.left.right.equalTo(self.view.safeAreaLayoutGuide)
            }
        }
    }
    
}

// MARK: - TableView Extensions
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getProductList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableCell.self), for: indexPath) as? ProductTableCell else { return UITableViewCell() }
        let model = viewModel.getProductList()
        cell.configureProductCard(model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProductDetailViewController()
        let detailData = viewModel.getProductList()[indexPath.row]
        vc.detailData = detailData
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
