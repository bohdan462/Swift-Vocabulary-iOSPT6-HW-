//
//  WordsTableTableViewController.swift
//  Swift Vocabulary
//
//  Created by Bohdan Tkachenko on 4/8/20.
//  Copyright © 2020 Bohdan Tkachenko. All rights reserved.
//

import UIKit


class WordsTableTableViewController: UITableViewController {
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        //Creating pop up alert
          let alertController = UIAlertController(title: "New Word", message: "Add a new word to the vocabulary", preferredStyle: .alert)
              alertController.addTextField { (textField : UITextField!) -> Void in
                      textField.placeholder = "Word"
                  }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Definition"
        }
            // Creating Save action
              let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let firstTextField = alertController.textFields![0].text //as UITextField
                let secondTextField = alertController.textFields![1].text
                guard let word = firstTextField else {return}
                guard let definition = secondTextField else {return}
                // Adding inputed iteams to the array
                self.vocabWords.append(VocabularyWord(word: word, definition: definition))
                //Reloading table view
                self.tableView.reloadData()
                    })
            //Cancel Action
              let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                      (action : UIAlertAction!) -> Void in })

                  alertController.addAction(saveAction)
                  alertController.addAction(cancelAction)
        

              self.present(alertController, animated: true, completion: nil)
        }
    
   

    // Created array of vocab words
    var vocabWords: [VocabularyWord] = [
        VocabularyWord(word: "Variable", definition: "A name value used to store inforamation. Variables can be changed after being created"),
        VocabularyWord(word: "Constant", definition: "Refer to fixed values that a program may not alter during its execution. Constants can not be changed after being created"),
        VocabularyWord(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to call the function to perform its task when needed.")
    
    ]


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

    


