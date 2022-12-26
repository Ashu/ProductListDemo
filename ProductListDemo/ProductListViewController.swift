//
//  ProductListViewController.swift
//  ProductListDemo
//
//  Created by ashu on 25/12/22.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productListTableView: UITableView!
    
    let viewModel = ProductListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getData {
            DispatchQueue.main.async {
                self.productListTableView.reloadData()
            }
        }
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productList?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        if let product = viewModel.productList?.products[indexPath.row] {
            cell.titleLabel.text = product.title
            cell.priceLabel.text = "$\(product.price?[0].value ?? 0)"
            cell.productImageView.loadFrom(URLAddress: product.imageURL ?? "")
        }
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

