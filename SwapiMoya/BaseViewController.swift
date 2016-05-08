//
//  BaseViewController.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 3/27/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import SwiftyJSON
import Bond

let cellIdentifier = String(PersonTableViewCell)
class BaseViewController: UIViewController {

    let viewModel = PersonTableViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 80
        viewModel.downloadPerson()
        
        bindViewModel()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    convenience init() {
        self.init(nibName: "BaseViewController", bundle: nil)
    }
    
    func bindViewModel() {
        viewModel.people.lift().bindTo(tableView) { indexPath, dataSource, tableView in
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PersonTableViewCell
            let person = dataSource[indexPath.section][indexPath.row]
            cell.configure(withPerson: person)
            return cell
        }
    }
}
