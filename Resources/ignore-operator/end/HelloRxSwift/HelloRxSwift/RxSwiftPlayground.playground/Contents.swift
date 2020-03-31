import UIKit
import RxSwift
import PlaygroundSupport

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes
.ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
}.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()


















