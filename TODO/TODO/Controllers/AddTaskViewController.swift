//
//  AddTaskViewController.swift
//  TODO
//
//  Created by Krishna Datt Shukla on 18/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObservable()
    }

    @IBOutlet weak var segmentControllPriority: UISegmentedControl!
    @IBOutlet weak var textFieldTask: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @IBAction func saveButtonAction() {
        guard let priority = Priority(rawValue: segmentControllPriority.selectedSegmentIndex), let title = textFieldTask.text else { return }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
