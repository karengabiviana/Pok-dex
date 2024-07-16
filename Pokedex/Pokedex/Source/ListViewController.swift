//
//  ListViewController.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 27/06/24.
//

import UIKit

class ListViewController: UIViewController {
    var viewModel: ViewModel!
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: "item")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = Service()
        viewModel = ViewModel(service: service)
        
        viewModel.loadData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 40
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.pokemon.count   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! CustomCell
        let pokemon = viewModel.pokemon[indexPath.row]
        cell.pokemonName.text = pokemon.name
        
        if let index = Int(pokemon.index) {
                cell.index.text = String(format: "#%03d", index)
            } else {
                cell.index.text = "#\(pokemon.index)"
            }
        
        return cell
    }
}
