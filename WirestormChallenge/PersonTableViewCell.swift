//
//  PersonTableViewCell.swift
//  WirestormChallenge
//
//  Created by Ninth Coast on 1/19/16.
//  Copyright © 2016 Ninth Coast. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class PersonTableViewCell : UITableViewCell {
    
    @IBOutlet weak var personSmallPic: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personPositionLabel: UILabel!
    
    func configureWithPerson(person: Person) {
        if let smallpic = person.smallpic {
            personSmallPic.sd_setImageWithURL(NSURL(string: smallpic))
        }
        personNameLabel.text     = person.name
        personPositionLabel.text = person.position
    }
    
}
