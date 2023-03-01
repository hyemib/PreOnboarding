//
//  ViewController.swift
//  pre_onboarding
//
//  Created by hyemi on 2023/02/28.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView = UITableView()
    private let loadAllButton = UIButton()
    
    let cellCount = 5

    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = .white
        
        setTableView()
        setAllLoadButton()
    }
    
    func setTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(UIEdgeInsets(top: 44, left: 0, bottom: 100, right: 0))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
    }
    
    func setAllLoadButton() {
        view.addSubview(loadAllButton)
        
        loadAllButton.setTitle("Load All Images", for: .normal)
        loadAllButton.backgroundColor = .systemBlue
        loadAllButton.layer.cornerRadius = 5
        
        
        loadAllButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(45)
        }
        
        loadAllButton.addTarget(self, action: #selector(selectedAllLoadButton), for: .touchUpInside)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageCell else { return .init() }
        cell.selectionStyle = .none
        return cell
    }
    
    @objc func selectedAllLoadButton(sender: UIButton!) {
        for index in 0..<cellCount {
            guard let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? ImageCell else { return }
            cell.selectedLoadButton(sender: sender)
        }
    }
}

