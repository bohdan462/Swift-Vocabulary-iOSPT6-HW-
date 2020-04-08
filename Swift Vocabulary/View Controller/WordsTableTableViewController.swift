//
//  WordsTableTableViewController.swift
//  Swift Vocabulary
//
//  Created by Bohdan Tkachenko on 4/8/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit


class WordsTableTableViewController: UITableViewController {

    let alertButton = UIAlertController(title: "New Vocabulary", message: "Add new vocab word here", preferredStyle: .actionSheet)
    
    let button=UIButton.init(type: .system)
    
    func allertShow() {
    button.setTitle("NEXT", for: .normal)
    button.frame.size = CGSize(width: 100, height: 50)
    self.view.addSubview(button)
    

    //set constrains
    button.translatesAutoresizingMaskIntoConstraints = false
    if #available(iOS 11.0, *) {
         button.rightAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
         button.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    } else {
         button.rightAnchor.constraint(equalTo: tableView.layoutMarginsGuide.rightAnchor, constant: 0).isActive = true
         button.bottomAnchor.constraint(equalTo: tableView.layoutMarginsGuide.bottomAnchor, constant: -10).isActive = true
    }
}
    
    
    var vocabWords: [VocabularyWord] = [
        VocabularyWord(word: "Variable", definition: "A name value used to store inforamation. Variables can be changed after being created"),
        VocabularyWord(word: "Constant", definition: "Refer to fixed values that a program may not alter during its execution. Constants can not be changed after being created"),
        VocabularyWord(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to call the function to perform its task when needed.")
    
    ]
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vocabWords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)

        let word = vocabWords[indexPath.row]
        cell.textLabel?.text = word.word

        return cell
    }
    

  


    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinitionSegue" {
            guard let destinationVC = segue.destination as? DefinitionViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let vocabWord = vocabWords[indexPath.row]
            destinationVC.vocabWord = vocabWord
             }
                 
         }
    
    
    }

    


