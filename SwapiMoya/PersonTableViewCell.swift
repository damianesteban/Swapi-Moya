//
//  PersonTableViewCell.swift
//  SwapiMoya
//
//  Created by Damian Esteban on 5/7/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personBirthYearLabel: UILabel!
    @IBOutlet weak var personHomeworldLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withPerson person: Person) {
        personNameLabel.text = "Name: \(person.name)"
        personBirthYearLabel.text = "Birth Year: \(person.birthYear)"
    }
    
}
