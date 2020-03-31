import UIKit
import RxSwift
import RxCocoa


let disposeBag = DisposeBag()

//let observable1 = Observable.just(1)
//
//let observable2 = Observable.of(1,2,3)
//
//let observable3 = Observable.of([1,2,3])
//
//let observable4 = Observable.from([1,2,3,4,5])
//
//observable4.subscribe { (event) in
//    if let element = event.element {
//        print(element)
//    }
//}
//
//
//let subscription4 = observable4.subscribe(onNext: { element in
//    print(element)
//})
//
//observable3.subscribe { (event) in
//    if let element = event.element {
//        print(element)
//    }
//}
//
//subscription4.dispose()
//
//
//let disposeBag = DisposeBag()
//
//Observable.of("A", "B", "C")
//    .subscribe{
//        print($0)
//    }
//.disposed(by: disposeBag)
//
//
//Observable<String>.create { (observer) -> Disposable in
//
//    observer.onNext("A")
//    observer.onCompleted()
//    observer.onNext("?") // it will never call
//    return Disposables.create()
//}.subscribe(onNext: {
//        print($0)
//    }, onError: {
//    print($0)
//    }, onCompleted: {
//        print("completed")
//    }, onDisposed: {
//        print("disposed")
//    })
//.disposed(by: disposeBag)
//





//
//let subject = PublishSubject<String>()
//
//subject.onNext("Issue 1") //will not get called because we have not subscribed to subject yet
//
//subject.subscribe { event in
//    print(event)
//}
//
//subject.onNext("Issue 2")
//subject.onNext("Issue 3")
//
//subject.onCompleted()
//
//
//subject.dispose()
//
//subject.onNext("Next 4")





//let behaveSubject = BehaviorSubject(value: "Initial Value")
//
//behaveSubject.onNext("Last issue")
//
//behaveSubject.subscribe { (event) in
//    print(event)
//}
//
//behaveSubject.onNext("Issue 1")
//behaveSubject.onNext("issue 2")





//let subject = ReplaySubject<String>.create(bufferSize: 1)
//
//subject.onNext("P 1")
//subject.onNext("P 2")
//subject.onNext("P 3")
//
//
//subject.subscribe{
//    print($0)
//}
//
//subject.onNext("P 4")
//subject.onNext("P 5")
//
//subject.subscribe{
//    print($0)
//}



//
//let relay = BehaviorRelay(value: "Initial value")
//
//relay.asObservable()
//    .subscribe {
//        print($0)
//}
//
//relay.accept("Hello World")
//



//let relay = BehaviorRelay(value: [String]())
//
//relay.asObservable()
//    .subscribe {
//        print($0)
//}
//
//relay.accept(["E1"])
//relay.accept(relay.value + ["E2"])
//
//var value = relay.value
//value.append("E1")
//value.append("E2")
//value.append("E3")
//value.append("E4")
//
//relay.accept(value)
//




//let strikes = PublishSubject<String>()
//strikes
//.ignoreElements()
//    .subscribe { _ in
//        print("subscription is called")
//}.disposed(by: disposeBag)
//
//
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")
//
//strikes.onCompleted()




//let strikes = PublishSubject<String>()
//strikes
//.elementAt(1)
//    .subscribe(onNext: { _ in
//        print("u r out!")
//}).disposed(by: disposeBag)
//
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")



//
//Observable.of("A", "B", "C", "D", "E", "F")
//    .skip(3)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//==========OR============
//==========OR============
//==========OR============
//let strikes = PublishSubject<String>()
//strikes
//.skip(1)
//    .subscribe(onNext: { subject in
//        print(subject)
//}).disposed(by: disposeBag)
//
//strikes.onNext("A")
//strikes.onNext("B")
//strikes.onNext("C")






//Observable.of(1, 2, 3, 4, 5, 6)
//    .skipWhile { (number) -> Bool in
//        number <= 3
//    }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)






//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject
//.skipUntil(trigger)
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)
//
//subject.onNext("A")
//subject.onNext("B")
//
//trigger.onNext("X")
//subject.onNext("C")
//subject.onNext("D")





//Observable.of(1, 2, 3, 4, 5, 6)
//.take(5)
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)






//Observable.of(1, 2, 3, 4, 5, 6)
//    .takeWhile({
//        $0 <= 2
//    })
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)








//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject
//.takeUntil(trigger)
//.subscribe(onNext: {
//    print($0)
//}).disposed(by: disposeBag)
//
//subject.onNext("A")
//subject.onNext("B")
//
//trigger.onNext("X")
//
//subject.onNext("C")
//subject.onNext("D")







//Observable.of(1,2,3,4,5,6)
//.toArray()
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)






//
//Observable.of(1,2,3,4,5,6)
//    .map {
//        $0 * 2
//    }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//





//struct Student {
//    var score: BehaviorRelay<Int>
//}
//
//let john = Student(score: BehaviorRelay(value: 75))
//let kds  = Student(score: BehaviorRelay(value: 90))
//
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMap { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//student.onNext(john)
//john.score.accept(60)
//
//student.onNext(kds)
//kds.score.accept(50)
//








//struct Student {
//    var score: BehaviorRelay<Int>
//}
//
//let john = Student(score: BehaviorRelay(value: 75))
//let kds  = Student(score: BehaviorRelay(value: 90))
//
//
//let student = PublishSubject<Student>()
//
//student.asObservable()
//    .flatMapLatest { $0.score.asObservable() }
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)
//
//student.onNext(john)
//john.score.accept(60)
//
//student.onNext(kds)
//kds.score.accept(50)
//
//john.score.accept(100)






//let numbers = Observable.of(2,3,4)
//
//numbers.startWith(1)
//    .subscribe(onNext: {
//        print($0)
//    }).disposed(by: disposeBag)




let numbers1 = Observable.of(2,3,4)
let numbers2 = Observable.of(5,6,7)

let numbers = numbers1.concat(numbers2)


numbers
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
