//
//  ARMeasureViewController.swift
//  EqualPath
//
//  Created by macaron on 02/03/2023.
//

import UIKit
import ARKit
import SCNLine

class ARMeasureViewController: UIViewController, ARSCNViewDelegate {
    
    @IBAction func onAddButtonClick(_ sender: UIButton){
        if let position = doHitTestOnExistingPlanes() {
            if(!drawing){
                ar.scene = SCNScene()
                drawing = true
                let node = nodeWithPosition(position)
                ar.scene.rootNode.addChildNode(node)
                startPoint = node
            }else{
                drawing = false
                let node = nodeWithPosition(position)
                ar.scene.rootNode.addChildNode(node)
                lineNode = node
            }
        }
    }
    
    @IBOutlet weak var measure: UILabel!
    
    @IBOutlet weak var ar: ARSCNView!
    //var dictPlanes = [ARPlaneAnchor: Plane]()
    var startPoint: SCNNode?
    var lineNode: SCNNode?
    var drawing: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
    }

    func setupScene(){
        ar.delegate = self
        ar.showsStatistics = false
        ar.autoenablesDefaultLighting = true

        //ar.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]

        let scene = SCNScene()
        ar.scene = scene
    }

    func getDrawLineFrom(pos1: SCNVector3, toPos2: SCNVector3) -> SCNNode {
        let line = lineFrom(vector: pos1, toVector: toPos2)
        let lineInBetween1 = SCNNode(geometry: line)
        return lineInBetween1
    }

    func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let line = SCNGeometry.line(points: [vector1, vector2], radius: 0.02, edges: 64).0
        line.firstMaterial?.diffuse.contents = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        line.firstMaterial?.lightingModel = .constant
        return line
    }

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if(drawing){
            DispatchQueue.main.async {
                guard let currentPosition = self.doHitTestOnExistingPlanes(),
                      let start = self.startPoint
                else {
                    return
                }

                if(self.drawing){
                    self.lineNode?.removeFromParentNode()
                }
                self.lineNode = self.getDrawLineFrom(pos1: currentPosition, toPos2: start.position)
                self.ar.scene.rootNode.addChildNode(self.lineNode!)

                let desc = self.getDistanceStringBetween(pos1: currentPosition, pos2: start.position)

                DispatchQueue.main.async {
                    self.measure.text = desc
                }
            }
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            if let planeAnchor = anchor as? ARPlaneAnchor {
                let plane = Plane(anchor: planeAnchor)
                node.addChildNode(plane)
                //self.dictPlanes[planeAnchor] = plane
            }
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            if let planeAnchor = anchor as? ARPlaneAnchor {
                //let plane = self.dictPlanes[planeAnchor]
                //plane?.updateWith(planeAnchor)
            }
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        if let planeAnchor = anchor as? ARPlaneAnchor {
            //dictPlanes.removeValue(forKey: planeAnchor)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupARSession()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ar.session.pause()
    }

    func setupARSession(){
        let configuration  = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        ar.session.run(configuration)
    }

    func doHitTestOnExistingPlanes() -> SCNVector3? {
        let results = ar.hitTest(view.center, types: .existingPlaneUsingExtent)
        if let result = results.first {
            let hitPos = self.positionFromTransform(result.worldTransform)
            return hitPos
        }
        return nil
    }

    func positionFromTransform(_ transform: matrix_float4x4) -> SCNVector3 {
        SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
    }

    func nodeWithPosition(_ position: SCNVector3) -> SCNNode {
        let sphere = SCNSphere(radius: 0.05)
        sphere.firstMaterial?.diffuse.contents = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        sphere.firstMaterial?.lightingModel = .constant
        sphere.firstMaterial?.isDoubleSided = true

        let node = SCNNode(geometry: sphere)
        node.position = position
        return node
    }

    func getDistanceStringBetween(pos1: SCNVector3?, pos2: SCNVector3?) -> String {
        if(pos1 == nil || pos2 == nil){
            return "0"
        }
        
        let d = distanceBetweenPoint(A: pos1!, B: pos2!)
        if(d >= 2){
            return String(format: "%.2f mètres", Float(d))
        }else{
            return String(format: "%.2f mètre", Float(d))
        }
    }

    func distanceBetweenPoint(A: SCNVector3, B: SCNVector3) -> CGFloat{
        let l = sqrt (
                (A.x - B.x) * (A.x - B.x)
                        + (A.y - B.y) * (A.y - B.y)
                        + (A.z - B.z) * (A.z - B.z)
        )
        return CGFloat(l)
    }
}
