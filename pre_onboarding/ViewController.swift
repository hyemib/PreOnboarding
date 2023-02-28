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

    override func viewDidLoad() {
        super.viewDidLoad()
            
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(loadAllButton)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(UIEdgeInsets(top: 44, left: 0, bottom: 100, right: 0))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
        
        loadAllButton.setTitle("Load All Images", for: .normal)
        loadAllButton.backgroundColor = .systemBlue
        loadAllButton.layer.cornerRadius = 5


        loadAllButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(45)
        }
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageCell else { return .init() }
        return cell
    }
}

