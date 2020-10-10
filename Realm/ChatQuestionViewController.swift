//
//  ChatQuestionViewController.swift
//  TodoRealm
//
//  Created by 古田翔太郎 on 2020/10/09.
//  Copyright © 2020 古田翔太郎. All rights reserved.
//

import UIKit
import RealmSwift

class ChatQuestionViewController: UIViewController {

    var todo: Todo?

    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
