import Foundation

import Bond
import ReactiveKit

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
