import Combine
import Foundation
import UIKit

class OldService {
    func oldServiceCall(completion: @escaping (Result<Data, Error>) -> Void) {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(error!))
            } else if data != nil {
                completion(.success(data!))
            } else {
                completion(.failure(NSError(domain: "no error or data returned", code: -1, userInfo: nil)))
            }
        }
        
        task.resume()
    }
}

class OldUser {
    let oldService = OldService()
    
    func performOldServiceCall() {
        oldService.oldServiceCall { (result) in
            switch result {
            case .success(let data):
                print("Success we got data: \(data) - Old Service Call")
            case .failure(let error):
                print("Oh no we got an error: \(error.localizedDescription)")
            }
        }
    }
}

let oldUser = OldUser()
oldUser.performOldServiceCall()
oldUser.performOldServiceCall()

/* ############################### */

class NewService {
    var cancellable: [AnyCancellable] = []
    
    func newServiceCall() -> Future<Data, Never> {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        return Future { promise in
            session.dataTaskPublisher(for: url).tryMap({ (data, _) in
                return data
            }).replaceError(with: Data()).sink(receiveValue: { promise(.success($0)) }).store(in: &self.cancellable)
        }
    }
}


class NewUser {
    let newService = NewService()
    var cancellables: [AnyCancellable] = []
    
    func performNewServiceCall() {
        newService.newServiceCall().sink(receiveValue: { print("Success we got data: \($0) - New Service Call") }).store(in: &cancellables)
    }
}

let newUser = NewUser()
newUser.performNewServiceCall()
newUser.performNewServiceCall()
