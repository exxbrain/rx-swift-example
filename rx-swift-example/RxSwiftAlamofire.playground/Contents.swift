import UIKit
import Alamofire
import RxSwift

class AssignedClassModel : Decodable {
    
}

enum Error: Swift.Error {
    case serviceDisabled
}

class APIService {
    static var singelton: APIService {
        get {
            return APIService()
        }
    }
    
    func getClassById(classId: Int) -> Observable<Int> {
        return Observable.create{observer -> Disposable in
            observer.onNext(1)
            observer.onCompleted()
            return Disposables.create()
        }
    }
}

class StudentModel {
}

class Database {
    static var singelton: Database {
        get {
            return Database()
        }
    }
    
    func fetchStudents(byCLassId: Int) -> [StudentModel]{
        return [StudentModel()]
    }
}

class TabBarViewController : UIViewController {
    
}

class StudentService {
    func getAssignedClassData(classId: Int) -> Observable<[StudentModel]> {
        return APIService.singelton
            .getClassById(classId: classId)
            .do(onError: { error in
                print(error)
            })
            .map { _ in Array(Database.singelton.fetchStudents(byCLassId: classId)) }
    }
}

class Controller : UIViewController {
    func fetchStudentsAndShowController() {
        StudentService()
            .getAssignedClassData(classId: 1)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
            })
    }
}

Controller().fetchStudentsAndShowController()
