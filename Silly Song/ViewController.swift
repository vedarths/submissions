//
//  ViewController.swift
//  Silly Song
//
//  Created by Sukriku on 26/09/2017.
//  Copyright © 2017 Vedarth Solutions. All rights reserved.
//

import UIKit

// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func shortenNameFromName(fullName: String) -> String {
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let lowercaseName = fullName.lowercased()
    
    if let index = lowercaseName.rangeOfCharacter(from: vowelSet)?.lowerBound {
        return lowercaseName.substring(from: index)
    }
    return fullName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    return bananaFanaTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortenNameFromName(fullName: fullName))
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {

    
    @IBOutlet weak var lyricsView: UITextView!
    @IBOutlet weak var nameField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    
    @IBAction func reset(_ sender: Any) {
        nameField.text=""
        lyricsView.text=""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        if ((nameField.text?.characters.count)! > 0) {
            nameField.text = nameField.text?.capitalized
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  }

