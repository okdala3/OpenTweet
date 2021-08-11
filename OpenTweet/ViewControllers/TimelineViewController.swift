//
//  ViewController.swift
//  OpenTweet
//
//  Created by Olivier Larivain on 9/30/16.
//  Copyright © 2016 OpenTable, Inc. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tweetView = TweetViewController()
    let hoverButton = HoverButton()
    var result: TimelineModel?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        parseJSON()
        
        tableView.reloadData()
        
        view.addSubview(hoverButton)
        view.bringSubviewToFront(hoverButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        hoverButton.frame = CGRect(x: view.frame.size.width - 70, y: view.frame.size.height - 100, width: 60, height: 60)
        hoverButton.addTarget(self, action: #selector(presentTweetModal), for: .touchUpInside)
    }
    
    @objc func presentTweetModal() {
        let destVC = TweetViewController()
        present(destVC, animated: true, completion: nil)
    }
    
    
    func setupNavigationBar() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemTeal]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.title = "Tiny Twitter"
    }
    
    //Setup TableView
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(TimeLineCell.self, forCellReuseIdentifier: TimeLineCell.resuseId)
        tableView.separatorColor = UIColor.blue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result!.timeline.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = result?.timeline[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeLineCell.resuseId, for: indexPath) as! TimeLineCell
        cell.selectionStyle = .none
        cell.author.text = model?.author
        cell.comment.text = model?.content
        cell.date.text = model?.date?.convertToDate()?.convertToMonthYearFormat()
        return cell
    }
}

//Normally this would be in a seperate netowrking file
//Also there would error handling around this networking call to make sure we get data back and to make sure there isn't an error we catch
extension TimelineViewController {
    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "timeline", ofType: "json") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(TimelineModel.self, from: jsonData)
        } catch {
            print("Error \(error)")
        }
    }
}
