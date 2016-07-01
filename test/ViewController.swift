//
//  ViewController.swift
//  test
//
//  Created by APPLE on 13/12/2015.
//  Copyright © 2015 Muhammad Waqas Bhati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var landScapeConstraint4: NSLayoutConstraint!
    @IBOutlet weak var landScapeConstraint3: NSLayoutConstraint!
    @IBOutlet weak var landScapeConstraint2: NSLayoutConstraint!
//    @IBOutlet weak var landScapeConstraint1: NSLayoutConstraint!
    @IBOutlet weak var landScapeConstraint: NSLayoutConstraint!
    @IBOutlet weak var sameHeightConstraintWhenVertical: NSLayoutConstraint!
    
    @IBOutlet weak var sameWidthWhenHorizontal: NSLayoutConstraint!
//    @IBOutlet weak var portrateConstraint4: NSLayoutConstraint!
    @IBOutlet weak var portrateConstraint3: NSLayoutConstraint!
    @IBOutlet weak var portrateConstraint2: NSLayoutConstraint!
//    @IBOutlet weak var portraitConstraint1: NSLayoutConstraint!
    @IBOutlet weak var portrateConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var firstView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(animated: Bool) {
        self.ApplyportraitConstraint()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            let orient = UIApplication.sharedApplication().statusBarOrientation
            
            switch orient {
            case .Portrait:
                print("Portrait")
                self.ApplyportraitConstraint()
                break
                // Do something
            default:
                print("LandScape")
                // Do something else
                self.applyLandScapeConstraint()
                break
            }
            }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
                print("rotation completed")
        })
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    func ApplyportraitConstraint(){
    
        self.view.addConstraint(self.portrateConstraint3)
        self.view.addConstraint(self.portrateConstraint2)
        self.view.removeConstraint(sameWidthWhenHorizontal)
        self.view.addConstraint(self.portrateConstraint)
        
        self.view.removeConstraint(sameHeightConstraintWhenVertical)
        self.view.removeConstraint(self.landScapeConstraint)
        self.view.removeConstraint(self.landScapeConstraint2)
        self.view.removeConstraint(self.landScapeConstraint3)
        self.view.removeConstraint(self.landScapeConstraint4)
        
    
    }
    func applyLandScapeConstraint(){
    
        self.view.removeConstraint(self.portrateConstraint3)
        self.view.removeConstraint(self.portrateConstraint2)
        self.view.removeConstraint(self.sameHeightConstraintWhenVertical)
        self.view.removeConstraint(self.portrateConstraint)
        
        self.view.addConstraint(self.sameWidthWhenHorizontal)
        self.view.addConstraint(self.landScapeConstraint)
        self.view.addConstraint(self.landScapeConstraint2)
        self.view.addConstraint(self.landScapeConstraint3)
        self.view.addConstraint(self.landScapeConstraint4)
    
    }

}

