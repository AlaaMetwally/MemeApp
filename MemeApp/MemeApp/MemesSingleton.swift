//
//  MemesSingleton.swift
//  MemeApp
//
//  Created by Geek on 1/21/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
import UIKit

class Memes {
    private init() { }
    static let sharedInstance = Memes()
    var memes = [Meme]()
}
