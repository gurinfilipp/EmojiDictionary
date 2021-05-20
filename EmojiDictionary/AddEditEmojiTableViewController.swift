//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Philip on 11.03.2021.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {
 
    
    var times = 0

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    var emoji: Emoji?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
            title = "Edit Emoji"
        } else {
            title = "Add Emoji"
        }
        updateSaveButtonState()
    }
    
    
    
    init?(coder:NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSaveButtonState() {
        let symbolText = symbolTextField.text ?? ""
        print("symbol text \(symbolText.isEmpty)")
        let nameText = nameTextField.text ?? ""
        print("name text \(nameText.isEmpty)")
        let descriptionText = descriptionTextField.text ?? ""
        print("descrip text \(descriptionText.isEmpty)")
        let usageText = usageTextField.text ?? ""
        print("usage text \(usageText.isEmpty)")
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else { return }
        
            let symbol = symbolTextField.text!
            let name = nameTextField.text ?? ""
            let description = descriptionTextField.text ?? ""
            let usage = usageTextField.text ?? ""
            emoji = Emoji(symbol: symbol, name: name,
               description: description, usage: usage)
        }
    
    
//    func updateSaveButtonState() {
//
//        print("апдейчу кнопку \(times) раз")
//        times += 1
//        let nameText = nameTextField.text ?? ""
//        print(nameText.isEmpty)
//        let descriptionText = descriptionTextField.text ?? ""
//        print(descriptionText.isEmpty)
//        let usageText = usageTextField.text ?? ""
//        print(usageText.isEmpty)
//        saveButton.isEnabled = containsSingleEmoji(symbolTextField) && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
//    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    func containsSingleEmoji(_ textfield: UITextField) -> Bool {
        guard let text = textfield.text, text.count == 1 else {
            return false
        }
        let isEmoji = text.unicodeScalars.first?.properties.isEmojiPresentation ?? false
        return isEmoji
    }
    
    


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
