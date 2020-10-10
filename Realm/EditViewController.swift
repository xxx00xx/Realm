//
//  EditViewController.swift
//  Realm
//
//  Created by 古田翔太郎 on 2020/10/09.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

/*
import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var editTextField: UITextField! {
        didSet {
            editTextField.delegate = self
        }
    }
    @IBOutlet weak var datePicker: UIDatePicker!

    var todo: Todo?

    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // if letを使うとシンプルに書ける
        if let todo = todo {
            editTextField.text = todo.title
            //datePicker.date = todo.deadline
        }
    }

    // UX向上のためにキーボードをしまう処理を書くことも大事
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        editTextField.resignFirstResponder()
    }
    
    @IBAction func tappedSaveButton() {
        // ここでアラートを出してもいい
        guard let title = editTextField.text else {
            return
        }

        let updateTodo: Todo
        if let todo = todo {
            updateTodo = todo
        } else {
            updateTodo = Todo()
            updateTodo.id = lastId()
        }

        try! realm.write {
            updateTodo.title = title
            updateTodo.deadline = datePicker.date
            realm.add(updateTodo)
        }

        dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedCancelButton() {
        dismiss(animated: true, completion: nil)
    }

    private func lastId() -> Int {
        let todos = realm.objects(Todo.self)
        if let lastTodo = todos.last {
            return lastTodo.id + 1
        } else {
            return 0
        }
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


import UIKit
import RealmSwift

class EditViewController: UIViewController {

    @IBOutlet weak var editTextField: UITextField! {
        didSet {
            editTextField.delegate = self
        }
    }
    //@IBOutlet weak var datePicker: UIDatePicker!
    
    var todo: Todo?

    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // if letを使うとシンプルに書ける
        if let todo = todo {
            editTextField.text = todo.title
            //datePicker.date = todo.deadline
        }
    }

    // UX向上のためにキーボードをしまう処理を書くことも大事
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        editTextField.resignFirstResponder()
    }
    
    @IBAction func tappedSaveButton() {
        // ここでアラートを出してもいい
        guard let title = editTextField.text else {
            return
        }

        let updateTodo: Todo
        if let todo = todo {
            updateTodo = todo
        } else {
            updateTodo = Todo()
            updateTodo.id = lastId()
        }
        //時刻を取得
        try! realm.write {
            updateTodo.title = title
            
            let dt = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd HH:mm", options: 0, locale: Locale(identifier: "ja_JP"))
            updateTodo.time = dateFormatter.string(from: dt)
            //updateTodo.deadline = datePicker.date
            realm.add(updateTodo)
        }

        dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedCancelButton() {
        dismiss(animated: true, completion: nil)
    }

    private func lastId() -> Int {
        let todos = realm.objects(Todo.self)
        if let lastTodo = todos.last {
            return lastTodo.id + 1
        } else {
            return 0
        }
    }
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
*/
