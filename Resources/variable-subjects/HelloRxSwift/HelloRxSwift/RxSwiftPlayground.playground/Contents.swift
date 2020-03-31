import UIKit
import RxSwift

let disposeBag = DisposeBag()

let variable = Variable([String]())

variable.value.append("Item 1")

variable.asObservable()
    .subscribe {
        print($0)
}

variable.value.append("Item 2")


















