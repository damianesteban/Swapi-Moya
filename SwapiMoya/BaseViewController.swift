//
//  BaseViewController.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 3/27/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//


import UIKit
import SwiftyJSON
import RxSwift
import RxCocoa

let cellIdentifier = String(PersonTableViewCell)

class BaseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    let swapiService = SwapiService()
    
    convenience init() {
        self.init(nibName: "BaseViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")

        swapiService.fetchMorePeople()
            .bindTo(tableView.rx_itemsWithCellFactory) { (tableView, row, item) in
                let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell",
                    forIndexPath: NSIndexPath(forRow: row, inSection: 0))
                cell.textLabel?.text = item.name
                return cell
            }.addDisposableTo(disposeBag)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
