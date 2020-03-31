import UIKit
import RxSwift

let disposeBag = DisposeBag()

let subject = BehaviorSubject(value: "Initial Value")

subject.onNext("Last Issue")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 1")























