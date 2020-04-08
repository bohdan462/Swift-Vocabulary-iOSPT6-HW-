//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Bohdan Tkachenko on 4/8/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    var vocabWord: VocabularyWord?
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var textField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      updateViews()
    }
    

 func updateViews() {
       if let word = vocabWord {
        labelName.text = word.word
        textField.text = word.definition
       }
   }

}
