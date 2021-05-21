//
//  ViewController.swift
//  CoreDataHelper
//
//  Created by charanbir sandhu on 17/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        Login.save(context: CoreDataHelper.shared.context1, name: "abc")
        for obj in Login.get(context:  CoreDataHelper.shared.context1) {
            print("store1", obj.name)
        }

//        Login.save(context: CoreDataHelper.shared.context2, name: "aman")
//        for obj in Login.get(context:  CoreDataHelper.shared.context2) {
//            print("store2", obj.name)
//        }
    }


}

