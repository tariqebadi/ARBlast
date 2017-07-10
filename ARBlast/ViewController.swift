//
//  ViewController.swift
//  ARBlast
//
//  Created by Tariq on 7/9/17.
//  Copyright © 2017 Tariq. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var SceneDisplay: ARSCNView!
    @IBOutlet weak var DisplayCounter: UILabel!
    
    var counter:Int = 0 {
        didSet {
            DisplayCounter.text = "\(counter)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scene = SCNScene()
        
        SceneDisplay.scene = scene
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingSessionConfiguration()
        
        SceneDisplay.session.run(configuration)
        addObject()
        
    }
    
    func addObject(){
        let jet = FlyingJet()
        jet.getFjet()
        
        let x = positions(lowerBound: 1.5, upperBound: 1.5)
        let y = positions(lowerBound: 1.5, upperBound: 1.5)
        
        jet.position = SCNVector3(x,y, -1)
        SceneDisplay.scene.rootNode.addChildNode(jet)
    }
    
    func positions ( lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: SceneDisplay)
            
            let hitbox = SceneDisplay.hitTest(location, options: nil)
            if let hitjet = hitbox.first{
                let node = hitjet.node
                
                if node.name == "Jet" {
                    counter += 1
                    node.removeFromParentNode()
                    addObject()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

