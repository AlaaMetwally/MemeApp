//
//  TopTextFieldDelegate.swift
//  MemeApp
//
//  Created by Geek on 1/2/19.
//  Copyright © 2019 Geek. All rights reserved.
//

import Foundation
import UIKit

var isUsingBottomDefaultText:Bool = true
var isUsingTopDefaultText:Bool = true

extension MemeEditorViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == bottomTextField && isUsingBottomDefaultText {
            textField.text = ""
            isUsingBottomDefaultText = false
        }
        
        if textField == topTextField && isUsingTopDefaultText {
            textField.text = ""
            isUsingTopDefaultText = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
