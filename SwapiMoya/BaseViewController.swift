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
import Moya

let cellIdentifier = String(PersonTableViewCell)

class BaseViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    
    convenience init() {
        self.init(nibName: "BaseViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        fetchPeople()
            .bindTo(tableView.rx_itemsWithCellFactory) { (tableView, row, item) in
                let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell",
                                                                       forIndexPath: NSIndexPath(forRow: row,
                                                                        inSection: 0))
                cell.textLabel?.text = item.name
                return cell
        }.addDisposableTo(disposeBag)
        
        tableView.reloadData()
    }
    
    func fetchPeople() -> Observable<[Person]> {
        print("fetching")
        return SwapiProvider.request(.People)
            .observeOn(MainScheduler.instance)
            .debug()
            .mapJSON()
            .map { json in
                return Person.arrayFromJSON(json)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
