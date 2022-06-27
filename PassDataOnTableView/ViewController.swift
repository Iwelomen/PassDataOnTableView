//
//  ViewController.swift
//  PassDataOnTableView
//
//  Created by Decagon on 6/26/22.
//

import UIKit

struct Category {
    let title: String
    let item: [String]
}


class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let data: [Category] = [
        Category(title: "Fruits", item: ["Apple", "Banana", "Orange", "Grape"]),
        Category(title: "Apple Devices", item: ["Mac", "iPhone", "iPad", "Apple watch"]),
        Category(title: "Car models", item: ["Bmw", "Honda", "Benz", "Toyota"]),
        Category(title: "Weather", item: ["Sunny", "Rain", "cloudy", "overcase"]),
        Category(title: "Cities", item: ["New York", "Chicago", "LA", "San Fransisco"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let Category = data[indexPath.row]
        
        let vc = ListViewController(item: Category.item)
        vc.title = Category.title
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
}

