//
//  MemeImageView.swift
//  MemeApp
//
//  Created by Geek on 1/18/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
import UIKit

class MemeImageViewController: UIViewController{
    
    @IBOutlet weak var memeImage: UIImageView!
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memeImage.image =  meme!.memedImage
    }
}
