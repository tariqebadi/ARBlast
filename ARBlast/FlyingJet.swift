//
//  FlyingJet.swift
//  ARBlast
//
//  Created by Tariq on 7/9/17.
//  Copyright © 2017 Tariq. All rights reserved.
//

import ARKit

class FlyingJet: SCNNode {
    
    func getFjet()
    {
        guard let myFjet = SCNScene(named: "art.scnassets/fjet.dae")
            else
        {return}
        
        let wrapNode = SCNNode()
        
        for child in myFjet.rootNode.childNodes{
            wrapNode.addChildNode(child)
        }
        
        self.addChildNode(wrapNode)
        
    }
}


