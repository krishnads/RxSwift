import UIKit
import RxSwift

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 3")

//subject.dispose()

subject.onCompleted()

subject.onNext("Issue 4")





















