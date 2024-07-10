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
    
    let searchStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .center
        stackview.distribution = .fill
        stackview.spacing = 16
        stackview.layoutMargins = UIEdgeInsets(top: 16, left: 24, bottom: 16, right: 24)
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    let textfield: UITextField = {
        let field = UITextField()
        field.placeholder = "Search by Index or Pokémon"
        field.borderStyle = .roundedRect
        return field
    }()
    
    var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
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
        configureView()
    }
    
    func configureView() {
        searchStackView.addArrangedSubview(textfield)
        searchStackView.addArrangedSubview(doneButton)
        searchStackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 48)
        tableView.tableHeaderView = searchStackView
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
    
    func configureDoneButton() {
        doneButton.addTarget(self, action: #selector(viewModel.doneButtonPressed), for: .touchUpInside)
    }
    
    func errorAlertController() {
        let alert = UIAlertController(title: "Error", message: "Try again", preferredStyle: .alert )
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewModel.pokemon.count   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! CustomCell
        let pokemon = viewModel.pokemon[indexPath.row]
        cell.index.text = String(format: "#%03d", indexPath.row + 1)
        cell.pokemonName.text = pokemon.name
        return cell
    }
}
