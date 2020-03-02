import Foundation

import Bond
import ReactiveKit

import RealmSwift

class ToDoViewModel {
    public let tasksList = MutableObservableArray<String>()
    
    func addTask(task: String) {
        tasksList.append(task)
        RealmPersistance.shared.setTask(newTask: task)
        RealmPersistance.shared.recordTask()
    }
    
    func remove(task id: Int) {
        RealmPersistance.shared.deleteTask(toDelete: tasksList[id])
        tasksList.remove(at: id)
    }
    
    func getSavedTasks() -> [String] {
        return RealmPersistance.shared.getRecoordedTask()
    }
}

 class Tasks: Object {
    @objc dynamic var task = ""
}

 class RealmPersistance {
    static let shared = RealmPersistance()
    private var newTask = ""
    private var tasksList: [String] = []

    private let realm = try! Realm()

    func getRecoordedTask() -> [String] {
        tasksList = []
        for t in realm.objects(Tasks.self) {
            tasksList.append(t.task)
        }

        return tasksList.reversed()
    }

    func setTask(newTask: String) {
        self.newTask = newTask
    }

    func recordTask() {
        try! realm.write {
            let task = Tasks()
            task.task = newTask
            realm.add(task)
        }
    }

    func deleteTask(toDelete: String) {
        for task in realm.objects(Tasks.self) {
            if toDelete == task.task {
                try! realm.write {
                    realm.delete(task)
                }
            }
        }

        tasksList = []
    }
}
