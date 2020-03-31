//
//  ToDoListViewController.swift
//  TODO
//
//  Created by Krishna Datt Shukla on 18/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ToDoListViewController: UIViewController {
    
//    private var tasks = Variable<[Task]>([]) //Variable Depricated - use Behaviour Relay - RxCocoa
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()

    @IBOutlet weak var segmentControllPriority: UISegmentedControl!
    @IBOutlet weak var tableViewList: UITableView!

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableViewList.estimatedRowHeight = 50
        tableViewList.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func priorityValueChangeAction(sender: UISegmentedControl) {
        let priority = Priority(rawValue: sender.selectedSegmentIndex - 1)
        filterTasks(by: priority)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let controller = segue.destination as? AddTaskViewController else { return }
        
        controller.taskSubjectObservable.subscribe(onNext: { [weak self] task in
            let priority = Priority(rawValue: (self?.segmentControllPriority.selectedSegmentIndex)! - 1)
            self?.tasks.accept((self?.tasks.value)! + [task])
            self?.filterTasks(by: priority)
        }).disposed(by: disposeBag)
        
    }
    
    private func updateList() {
        DispatchQueue.main.async { [unowned self] in
            self.tableViewList.reloadData()
        }
    }
    
    func filterTasks(by priority: Priority?) {
        if priority == nil {
            filteredTasks = tasks.value
            self.updateList()
        } else {
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == priority! }
            }.subscribe(onNext: { [weak self] tasks in
                self?.filteredTasks = tasks
                self?.updateList()
            }).disposed(by: disposeBag)
        }
    }
    

}

extension ToDoListViewController: UITableViewDelegate {
    
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = filteredTasks[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
}
