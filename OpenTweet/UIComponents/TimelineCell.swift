//
//  TimelineCell.swift
//  OpenTweet
//
//  Created by Dala  on 8/10/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimeLineCell: UITableViewCell {
    static let resuseId = "TimeLineCell"
    
    //Setup Views
    let author: UILabel = {
        let author = UILabel()
        author.textColor = .white
        author.font = .systemFont(ofSize: 17, weight: .bold)
        author.numberOfLines = 0
        author.backgroundColor = .red
        author.layer.cornerRadius = 10
        author.layer.masksToBounds = true
        return author
    }()
    
    let comment: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        return label
        
    }()
    
    let date: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.systemTeal
        
        contentView.addSubview(author)
        contentView.addSubview(comment)
        contentView.addSubview(date)
        
        configureView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configureView()
    }
    
    func configureView() {
        author.translatesAutoresizingMaskIntoConstraints = false
        comment.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            author.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            author.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            
            comment.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            comment.leadingAnchor.constraint(equalTo: author.leadingAnchor, constant: 20),
            comment.trailingAnchor.constraint(equalTo: author.trailingAnchor, constant: -20),
            
            date.topAnchor.constraint(equalTo: comment.bottomAnchor, constant: 12),
            date.leadingAnchor.constraint(equalTo: author.leadingAnchor, constant: 20),
            date.trailingAnchor.constraint(equalTo: author.trailingAnchor, constant: -20),
            date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
