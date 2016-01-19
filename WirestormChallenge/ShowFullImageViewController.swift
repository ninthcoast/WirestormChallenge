//
//  ShowFullImageViewController.swift
//  WirestormChallenge
//
//  Created by Ninth Coast on 1/19/16.
//  Copyright © 2016 Ninth Coast. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ShowFullImageViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageURL: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageURL != nil {
            imageView.sd_setImageWithURL(NSURL(string: imageURL!))
        }
    }
    
}