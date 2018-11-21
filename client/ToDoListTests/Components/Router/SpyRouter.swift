@testable import ToDoList

class SpyRouter: Router {
    private(set) var showAddToDoItemViewController_wasCalled: Bool = false
    func showAddToDoItemViewController() {
        showAddToDoItemViewController_wasCalled = true
    }
    
    private(set) var dismissModalVC_wasCalled: Bool = false
    func dismissModalVC() {
        dismissModalVC_wasCalled = true
    }
}
