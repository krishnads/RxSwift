//
//  ViewController.swift
//  CameraFilter
//
//  Created by Krishna Datt Shukla on 14/01/20.
//  Copyright © 2020 Krishna Datt Shukla. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var buttonApplyFilter: UIButton!

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PhotosCollectionViewController else {
            fatalError("Segue destination is not found")
        }
        
        destination.selectedPhoto.subscribe(onNext: { [weak self] photo in
            DispatchQueue.main.async {
                self?.upDateUIWith(image: photo)
            }
            }
        ).disposed(by: disposeBag)
    }
    
    
    func upDateUIWith(image: UIImage) {
        self.photoImageView.image = image
        self.buttonApplyFilter.isHidden = false
    }

    @IBAction func filterButtonAction(sender: UIButton) {
        guard let image = self.photoImageView.image else {
            fatalError("No Image selected")
        }
        
        FilterService().applyFilter(to: image)
            .subscribe(onNext: { (filteredImage) in
                DispatchQueue.main.async {
                    self.photoImageView.image = filteredImage
                }
            }
        ).disposed(by: disposeBag)
        
        
    }
    
}

