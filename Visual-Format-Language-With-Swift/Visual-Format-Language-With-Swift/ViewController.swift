//
//  ViewController.swift
//  Visual-Format-Language-With-Swift
//
//  Created by Thuan on 3/29/17.
//  Copyright © 2017 Thuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var greenView: UIView!
    var redView: UIView!
    var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        createConstraints()
    }
    
    func initViews() {
        greenView = UIView()
        redView = UIView()
        blueView = UIView()
        
        greenView.backgroundColor = UIColor.green
        redView.backgroundColor = UIColor.red
        blueView.backgroundColor = UIColor.blue
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(greenView)
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
    }
    
    func createConstraints() {
        let views = Dictionary(dictionaryLiteral: ("red",redView), ("blue", blueView), ("green", greenView))
        
        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[red(blue)]-5-[blue]-16-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraint)
        
        let horizontalGreenViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[green]-5-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(horizontalGreenViewConstraint)
        
        let verticalRedViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[red]-5-[green(44)]-16-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(verticalRedViewConstraint)
        
        let verticalBlueViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[blue]-5-[green]-16-|", options: [], metrics: nil, views: views)
        self.view.addConstraints(verticalBlueViewConstraint)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

