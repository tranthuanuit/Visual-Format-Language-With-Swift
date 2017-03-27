//
//  ViewController.swift
//  Visual-Format-Language-With-Swift
//
//  Created by Thuan Tran on 3/27/17.
//  Copyright © 2017 Thuan Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vwBlue:UIView!
    var vwRed:UIView!
    var vwGreen:UIView!
    
    func initViews() {
        //Initialize
        vwRed = UIView()
        vwBlue = UIView()
        vwGreen = UIView()
        
        //Prep auto layout
        vwRed.translatesAutoresizingMaskIntoConstraints = false
        vwBlue.translatesAutoresizingMaskIntoConstraints = false
        vwGreen.translatesAutoresizingMaskIntoConstraints = false
        
        //Coloring
        vwRed.backgroundColor = UIColor.red
        vwBlue.backgroundColor = UIColor.blue
        vwGreen.backgroundColor = UIColor.green
        
        //Add them to the view
        self.view.addSubview(vwRed)
        self.view.addSubview(vwBlue)
        self.view.addSubview(vwGreen)
    }
    
    func createConstraints() {
        //Views to add constraints to
        let views = Dictionary(dictionaryLiteral: ("red",vwRed),("blue",vwBlue),("green",vwGreen))
        //Metrics for Visual Format string
        let metrics = Dictionary(dictionaryLiteral: ("spacing", 10),("lowWidth",100),("highWidth",200),("priority",20),("redBlueSpacing",0),("greenHeight",40))
        
        //Horizontal constraints
        let horizontalConstraintsRedBlue = NSLayoutConstraint.constraints(withVisualFormat: "H:|-spacing-[red(>=lowWidth,<=highWidth@priority)]-redBlueSpacing-[blue(==red)]-spacing-|", options: [], metrics: metrics, views: views)
        self.view.addConstraints(horizontalConstraintsRedBlue)
        let horizontalConstraintsGreen = NSLayoutConstraint.constraints(withVisualFormat: "H:|[green]|", options: [], metrics: nil, views: views)
        self.view.addConstraints(horizontalConstraintsGreen)
        
        //Vertical constraints
        let verticalConstraintsRed = NSLayoutConstraint.constraints(withVisualFormat: "V:|[red]-spacing-[green(greenHeight)]|", options: [], metrics: metrics, views: views)
        self.view.addConstraints(verticalConstraintsRed)
        let verticalConstraintsBlue = NSLayoutConstraint.constraints(withVisualFormat: "V:|[blue]-spacing-[green(greenHeight)]|", options: [], metrics: metrics, views: views)
        self.view.addConstraints(verticalConstraintsBlue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initViews()
        createConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

