//
//  ViewController.swift
//  MemoryCard
//
//  Created by MM on 4/7/20.
//  Copyright © 2020 MM. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var anchor:MyScene.Bread!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anchor = try! MyScene.loadBread()
        arView.scene.anchors.append(anchor)
    }
}
