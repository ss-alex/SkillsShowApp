//
//  ViewController.swift
//  SkillsShowApp
//
//  Created by Лена Мырленко on 2021/2/12.
//

import UIKit

class ViewController: UIViewController {
    
    var calls = [Request] ()
    var sortedCallsArray = [Request] ()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigation()
        setupTableView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.shouldRemoveShadow(true)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.backgroundColor = .white
        tableView.register(Cell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "Missed calls"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.layer.shadowColor = UIColor.white.cgColor
    }

    private func fetchData() {
        let urlString = "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }

    private func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCalls = try? decoder.decode(Calls.self, from: json) {
            calls = jsonCalls.requests
            print("calls = \(calls)")
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let call = sortedCallsArray[indexPath.row]
        let duration = call.duration ?? "0:12"
        let name = call.client.Name ?? "Name is undentified"
        let number = call.client.address
        let type = call.businessNumber?.label ?? "Store"
        let businessNum = call.businessNumber?.number ?? ""
        
        navigationController?.pushViewController(MissedCallVC(duration: duration,
                                                              name: name,
                                                              number: number,
                                                              businessType: type,
                                                              businessNum: businessNum),
                                                 animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        
        let sortedArray = calls.sorted(by: {$0.created < $1.created})
        sortedCallsArray = sortedArray
        
        let call = sortedArray[indexPath.row]
        let duration = call.duration ?? "0:12"
        let name = call.client.Name
        let number = call.client.address
        let created = call.created
        
        
        cell.set(duration: duration,
                 name: name,
                 number: number,
                 created: created)
        
        cell.selectionStyle = .none
        
        return cell
    }
}
