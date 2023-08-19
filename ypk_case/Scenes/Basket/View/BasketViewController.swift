//
//  BasketViewController.swift
//  ypk_case
//
//  Created by İlkay Sever on 17.08.2023.
//

import UIKit

final class BasketViewController: BaseViewController {
    
    // MARK: - UI Components
    private let tableView: UITableView = UITableView()
    
    private let confirmButton: UIButton = UIButton()
    private let emptyLabel: UILabel = UILabel()
    
    // MARK: - Variables
    let viewModel = CartViewModel()
    var productCount = 20
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCartList()
    }
    
    private func fetchCartList() {
        viewModel.cartListRequest()
        //        viewModel.group.notify(queue: .main) {
        //            self.tableView.reloadData()
        //        }
        viewModel.didSuccess = {
            self.productCount = self.viewModel.productList.count
            self.drawDesign()
        }
        viewModel.didFailure = { errror in
            print(errror)
        }
    }
    
    private func configureUI() {
        view.addSubviews(emptyLabel, tableView, confirmButton)
        drawDesign()
    }
    
    private func drawDesign() {
        confirmButton.isHidden = true
        tableView.isHidden = true
        emptyLabel.isHidden = true
        DispatchQueue.main.async {
            self.emptyUI()
            self.buyButton()
            if self.productCount != 0 {
                self.tableView.isHidden = false
                self.confirmButton.isHidden = false
            } else {
                self.emptyLabel.isHidden = false
            }
        }
        tableView.reloadData()
    }
    
    @objc private func didTappedConfirm() {
        productCount = 0
        viewModel.productList.removeAll()
        viewModel.paymentRequest()
        viewModel.paymentGroup.notify(queue: .main) {
            self.drawDesign()
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
extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableCell.self), for: indexPath) as? ProductTableCell else { return UITableViewCell() }
        let productList = viewModel.productList
        cell.configureProductCard(productList[indexPath.row].product, quantity: productList[indexPath.row].quantity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

// MARK: - UI Components Constraints Extension
extension BasketViewController {
    
    private func emptyUI() {
        emptyLabel.text = "Sepetinizde Henüz Hiç Ürün Yok."
        emptyLabel.font = AppFonts.UbuntuBold24
        emptyLabel.numberOfLines = 0
        emptyLabel.textAlignment = .center
        emptyLabel.textColor = AppColors.white
        emptyLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide).offset(32)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-32)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY)
        }
    }
    
    private func buyButton() {
        confirmButton.setTitle("Satın Al", for: .normal)
        confirmButton.backgroundColor = AppColors.borderColor
        confirmButton.addCornerRadius(radius: 8)
        confirmButton.addTarget(self, action: #selector(didTappedConfirm), for: .touchUpInside)
        confirmButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(56)
        }
    }
    
}
