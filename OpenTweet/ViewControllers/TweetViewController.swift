//
//  TweetViewController.swift
//  OpenTweet
//
//  Created by Dala  on 8/10/21.
//  Copyright © 2021 OpenTable, Inc. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITextFieldDelegate {
   
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = textViewFont
        textView.isScrollEnabled = false
        textView.backgroundColor = .systemGray5
        textView.layer.cornerRadius =  10
        textView.layer.opacity = 0.7
        textView.text = "First Tweet"
        
        return textView
    }()
    
    let tweetButton = TweetButton(backgroundColor: .blue, title: "Send My Tweet!")
    let titleLabel = UILabel()
    let stackView = UIStackView()
    let textViewFont = UIFont.systemFont(ofSize: 16)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        
        configureTitle()
        configureStackView()
        configureButton()
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        setupStackViewConstraints()
        addElementsToStackView()
    }
    
    func configureTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            textView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configureButton() {
        tweetButton.addTarget(self, action: #selector(fireTweet), for: .touchUpInside)
        
        tweetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tweetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            tweetButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func fireTweet() {
        fireAlert()
    }
    
    func fireAlert() {
        let alert = UIAlertController(title: "Oops! Not backend yet. Let's add your name to the feature interaction list 😄", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            if let name = alert.textFields?.first?.text {
                print("Your name: \(name)")
            }
        }))
        
        self.present(alert, animated: true)
    }
    
    func addElementsToStackView() {
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(tweetButton)
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    func configureTitle() {
        view.addSubview(titleLabel)
        titleLabel.text = "Send Your First Tweet!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        
        setupTitleConstraints()
    }
    
    func setupTitleConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
