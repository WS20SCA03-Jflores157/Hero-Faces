//
//  Vitrual Content.swift
//  Hero Faces
//
//  Created by Jeffrey  on 6/29/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import ARKit
import SceneKit

enum VirtualContentType: Int {
    case ironMan, batMan, hulk, flash
    
    func makeController() -> VirtualContentController {
        switch self {
        
        case .ironMan:
            return TexturedFaceIronMan()
        case .batMan:
            return TexturedFaceBatMan()
        case .hulk:
            return TexturedFaceHulk()
        case .flash:
            return TexturedFaceFlash()
        
        }
    }
}

/// For forwarding `ARSCNViewDelegate` messages to the object controlling the currently visible virtual content.
protocol VirtualContentController: ARSCNViewDelegate {
    /// The root node for the virtual content.
    var contentNode: SCNNode? { get set }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode?
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor)
}
