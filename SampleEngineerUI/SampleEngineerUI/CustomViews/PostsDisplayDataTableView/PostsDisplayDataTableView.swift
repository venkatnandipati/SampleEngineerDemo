//
//  PostsDisplayDataTableView.swift
//  SampleEngineerUI
//
//  Created by Venkateswara Reddy N on 23/08/19.
//  Copyright © 2019 ojas. All rights reserved.
//

import UIKit

class PostsDisplayDataTableView: UITableView,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    var numberOfRowsInTableView = NSMutableArray()
    var presntController: ViewController!
    var notFoundMessageString: String!
     var count = 1
    func reloadTableViewWithData(dataDictionary: NSMutableArray, presentviewController: ViewController, withNotFoundMessage: String) {
        notFoundMessageString = withNotFoundMessage
        numberOfRowsInTableView = dataDictionary
        presntController = presentviewController
        self.dataSource = self
        self.delegate = self
        self.separatorInset = .zero
        self.layoutMargins = .zero
        self.tableFooterView = UIView()
        self.separatorStyle = .singleLine
        self.reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInTableView.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PostsDataDisplayTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == numberOfRowsInTableView.count - 1 { // last cell
            count += 1
            print(count)
                presntController.getPostsData(count: count) // increment `fromIndex` by 20 before server call
            }
        let data = numberOfRowsInTableView[indexPath.row]
        if (data as AnyObject).object(forKey: "title") as? String != nil {
            cell.postNameLabel.text = (data as AnyObject).object(forKey: "title") as? String
        }
        if (data as AnyObject).object(forKey: "created_at") as? String != nil {
            cell.CreatedAtLabel.text = (data as AnyObject).object(forKey: "created_at") as? String
        }
       // cell.swi.image = UIImage(named: "countryImage")
        return cell }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           }
    }

