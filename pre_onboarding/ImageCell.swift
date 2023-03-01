//
//  ImageCell.swift
//  pre_onboarding
//
//  Created by hyemi on 2023/02/28.
//

import UIKit
import SnapKit

class ImageCell: UITableViewCell {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loadImageView, progressView, loadButton])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 3
        
        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-15)
        }
    
        return stackView
    }()
    
    lazy var loadImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "photo"))
        imageView.contentMode = .scaleToFill
        
        imageView.snp.makeConstraints {
            $0.width.equalTo(130)
            $0.height.equalTo(100)
        }
        return imageView
    }()
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        
        progressView.progressViewStyle = .default
        progressView.trackTintColor = .systemGray4
        progressView.progressTintColor = .systemBlue
        progressView.progress = 0.5
        
        return progressView
    }()
    
    lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        
        button.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        button.addTarget(self, action: #selector(selectedLoadButton), for: .touchUpInside)
        
        return button
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectedLoadButton(sender: UIButton!) {
        self.loadImageView.image = UIImage(systemName: "photo")
        
        let url = URL(string: "https://picsum.photos/200/300")!

        URLSession.shared.downloadTask(with: url, completionHandler: { (location, reponse, error) -> Void in
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)

                DispatchQueue.main.async {
                    self.loadImageView.image = image
                }
            }
        }).resume()
    }
}
