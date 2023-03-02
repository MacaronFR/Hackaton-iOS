//
//  Plane.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit
import ARKit

class Plane: SCNNode{

    var planeGeometry: SCNBox?

    init(anchor: ARPlaneAnchor){
        super.init()
        let width = CGFloat(anchor.extent.x)
        let length = CGFloat(anchor.extent.z)

        let planeHeight = 0.01 as CGFloat

        planeGeometry = SCNBox(width: width, height: planeHeight, length: length, chamferRadius: 0)

        let material = SCNMaterial()
        let image = UIImage(named: "grid")
        material.diffuse.contents = image

        let transparentMaterial = SCNMaterial()
        transparentMaterial.diffuse.contents = UIColor.white.withAlphaComponent(0.0)

        planeGeometry?.materials = [transparentMaterial, transparentMaterial, transparentMaterial, transparentMaterial, material, transparentMaterial]

        let planeNode = SCNNode(geometry: planeGeometry)
        planeNode.position = SCNVector3(0, -planeHeight/2.0, 0)

        addChildNode(planeNode)

        setTextureScale()
    }

    func setTextureScale(){
        let width = planeGeometry?.width
        let length = planeGeometry?.length

        let material = planeGeometry?.materials[4]
        material?.diffuse.contentsTransform = SCNMatrix4MakeScale(Float(width!), Float(length!), 0)
        material?.diffuse.wrapS = .repeat
        material?.diffuse.wrapT = .repeat
    }

    required init?(coder aDecoder: NSCoder){
        fatalError("int(coder:) has not benn implemented")
    }
    func updateWith(_ anchor: ARPlaneAnchor){
        planeGeometry?.width = CGFloat(anchor.extent.x)
        planeGeometry?.length = CGFloat(anchor.extent.z)

        position = SCNVector3(anchor.center.x, 0, anchor.center.z)

        setTextureScale()
    }
}
