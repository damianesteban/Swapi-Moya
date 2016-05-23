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
    var people: Observable<[Person]>?
    
    convenience init() {
        self.init(nibName: "BaseViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 80
        
        swapiService.fetchPeople()
            .observeOn(MainScheduler.instance)
            .subscribeNext { people in
                
                print(people)
        }
        .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
