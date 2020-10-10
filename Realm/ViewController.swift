//
//  ViewController.swift
//  Realm
//
//  Created by 古田翔太郎 on 2020/10/01.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    // didSetにまとめると確実に実行できる
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            // カスタムセルを使う場合はregisterを忘れずに
            tableView.register(UINib(nibName: "TodoTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    var todoArray: [Todo] = []
    
    let realm = try! Realm()
    // identifierは定数化しておくとタイプミスを減らせる
    let editSegueIdentifier = "toEdit"
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 今回はviewDidAppearでリロードする
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        todoArray = realm.objects(Todo.self).map { $0 }
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == editSegueIdentifier {
            let viewController = segue.destination as! ChatQuestionViewController
            viewController.todo = sender as? Todo
        }
    }

    @IBAction func tappedAddButton() {
        //performSegue(withIdentifier: editSegueIdentifier, sender: nil)
        
        /*--以下，新規チャットルーム作成用のアラート機能--*/
        var alertTextField: UITextField?
        var todo: Todo?
        let realm = try! Realm()
        var a:String = ""
        
        let alert = UIAlertController(
            title: "Chat Name",
            message: "Enter new chat name",
            preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(
            configurationHandler: {(textField: UITextField!) in
            alertTextField = textField
        })
        // アラートコントローラに"Cancel"ボタンを表示
        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: UIAlertAction.Style.cancel,
                handler: nil))
        // アラートコントローラに"Save"ボタンを表示
        alert.addAction(
            UIAlertAction(
                title: "Save",
                style: UIAlertAction.Style.default){ _ in//,handler: {(action) -> Void in
                    /*
                    func lastId() -> Int {
                        let todos = realm.objects(Todo.self)
                        if let lastTodo = todos.last {
                            return lastTodo.id + 1
                        } else {
                            return 0
                        }
                    }
                    */
                    
                    let updateTodo: Todo
                    if let todo = todo {
                        updateTodo = todo
                    } else {
                        updateTodo = Todo()
                        //updateTodo.id = lastId()
                    }
                    
                    try! realm.write {
                        // OKを押した時入力されていたテキストを表示
                        if let text = alertTextField?.text {
                            updateTodo.title = text
                        }
                        
                        let dt = Date()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd HH:mm", options: 0, locale: Locale(identifier: "ja_JP"))
                        updateTodo.time = dateFormatter.string(from: dt)
                        //updateTodo.deadline = datePicker.date
                        realm.add(updateTodo)
                        
                    }
            }
        )
        self.tableView.reloadData()
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TodoTableViewCell

        cell.titleLabel.text = todoArray[indexPath.row].title
        cell.dateLabel.text = todoArray[indexPath.row].time
        //cell.dateLabel.text = formatter.string(from: todoArray[indexPath.row].deadline)

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: editSegueIdentifier, sender: todoArray[indexPath.row])
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! realm.write {
                realm.delete(todoArray[indexPath.row])
            }
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

