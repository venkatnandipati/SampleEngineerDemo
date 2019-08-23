//
//  ViewController.swift
//  SampleEngineerUI
//
//  Created by Venkateswara Reddy N on 23/08/19.
//  Copyright © 2019 ojas. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var postsDataTableView: PostsDisplayDataTableView!
    var refreshControl = UIRefreshControl()
    var postDataArray = NSMutableArray()
    var count:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        postsDataTableView.addSubview(refreshControl)
        count = 1
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.getPostsData(count: 1)
    }
    //Pull to refresh Action
    @objc func refresh(sender:AnyObject) {

    }
 //Getting all posts data from getMethod
    func getPostsData(count:Int) {
        let service: APIWapper = APIWapper.init()
        service.startActivityIndictor()
        let url =  "https://hn.algolia.com/api/v1/search_by_date?tags=story&page="
        let finalString = url + String(count)
        Alamofire.request(finalString, method: .get, parameters: ["": ""], encoding: URLEncoding.default, headers: nil).responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success:
                 service.stopActivityIndicator()
                if response.result.value != nil {
                    let dict:NSDictionary! = response.result.value as? NSDictionary
                    self.postDataArray.addObjects(from: (dict.value(forKey: "hits") as! [Any]))
                    print(self.postDataArray.count)
                    self.navigationItem.title = String(self.postDataArray.count)
                    self.postsDataTableView.reloadTableViewWithData(dataDictionary: (self.postDataArray as NSArray).mutableCopy() as! NSMutableArray, presentviewController: self, withNotFoundMessage: "")
                }
            case .failure:
                service.stopActivityIndicator()
                print(response.result.error as Any)
            }
        }
    }
    
}

