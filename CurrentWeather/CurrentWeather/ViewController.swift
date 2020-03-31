//
//  ViewController.swift
//  CurrentWeather
//
//  Created by Abhishek Mishra on 30/03/20.
//  Copyright © 2020 InnoIntell. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldCityName: UITextField!
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.textFieldCityName.rx.value
//            .subscribe(onNext: { city in
//                if let city = city {
//                    if city.isEmpty {
//                        self.displayWeather(nil)
//                    } else {
//                        self.fetchWeather(by: city)
//                    }
//                }
//            }).disposed(by: disposeBag)
        
        
        self.textFieldCityName.rx.controlEvent(.editingDidEndOnExit)
        .asObservable()
            .map{ self.textFieldCityName.text }
                .subscribe(onNext: { city in
                    if let city = city {
                        if city.isEmpty {
                            self.displayWeather(nil)
                        } else {
                            self.fetchWeather(by: city)
                        }
                    }
                }).disposed(by: disposeBag)
    }


    private func displayWeather(_ weather: Weather?)  {
        if let weather = weather {
            self.labelTemperature.text = "\(weather.temp) ℉"
            self.labelHumidity.text = "\(weather.humidity) ⛈"
        } else {
            self.labelTemperature.text = "🐶"
            self.labelHumidity.text = "🍄"
        }
    }
    
    private func fetchWeather(by city: String?)  {
        guard let cityEncoded = city?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed), let url = URL.urlForWeatherAPI(city: cityEncoded) else {
            return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
        /////    1 - subcribe
        
//        URLRequest.load(resource: resource)
//            .observeOn(MainScheduler.instance)
//            .catchErrorJustReturn(WeatherResult.empty)
//            .subscribe(onNext: { result in
//
//                let weather = result.main
//                self.displayWeather(weather)
//            }).disposed(by: disposeBag)
        
        ////   2 - binding

//        let search = URLRequest.load(resource: resource)
//            .observeOn(MainScheduler.instance)
//            .catchErrorJustReturn(WeatherResult.empty)
//
//        search.map{ "\($0.main.temp) ℉" }
//            .bind(to: labelTemperature.rx.text)
//            .disposed(by: disposeBag)
//
//        search.map{ "\($0.main.humidity) ⛈" }
//            .bind(to: labelHumidity.rx.text)
//            .disposed(by: disposeBag)
        
        
        ////   3 - driver

//            let search = URLRequest.load(resource: resource)
//                .observeOn(MainScheduler.instance)
//                .asDriver(onErrorJustReturn: WeatherResult.empty)
        
            let search = URLRequest.load(resource: resource)
                .retry(3)
                .observeOn(MainScheduler.instance)
                .catchError { (error)  in
                    print(error.localizedDescription)
                    return Observable.just(WeatherResult.empty)
                }.asDriver(onErrorJustReturn: WeatherResult.empty)
        
            search.map{ "\($0.main.temp) ℉" }
                .drive(labelTemperature.rx.text)
                .disposed(by: disposeBag)
            
            search.map{ "\($0.main.humidity) ⛈" }
                .drive(labelHumidity.rx.text)
                .disposed(by: disposeBag)
    }
    
    
}

