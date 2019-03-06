//
//  ViewController.swift
//  World Tracking
//
//  Created by Rayan Slim on 2017-08-20.
//  Copyright © 2017 Rayan Slim. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var score: UILabel!
    var scoreValue : Int = 0
    var shapeIndex : Int!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {

        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        let scoreVal = String(scoreValue)
        score.text = scoreVal
        let shapeIndex : Int = Int.random(in: 0..<4)
        refreshScene(shapeIndex: shapeIndex)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func refreshScene(shapeIndex: Int){
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode() // Clear Scene
        }
        switch shapeIndex {
        case 0:
            //Box Rendering
            let node = SCNNode()
            node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
            node.position = SCNVector3(0,0,0)
            self.sceneView.scene.rootNode.addChildNode(node)
        case 1:
            //Sphere Rendering
            let node = SCNNode()
            node.geometry = SCNSphere(radius: 0.1)
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.red
            node.position = SCNVector3(0,0,0)
            self.sceneView.scene.rootNode.addChildNode(node)
        case 2:
            //Cylinder Rendering
            let node = SCNNode()
            node.geometry = SCNCylinder(radius: 0.1, height: 0.1)
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
            node.position = SCNVector3(0,0,0)
            self.sceneView.scene.rootNode.addChildNode(node)
        case 3:
            //Torus Rendering
            let node = SCNNode()
            node.geometry = SCNTorus(ringRadius: 0.05, pipeRadius: 0.1)
            node.geometry?.firstMaterial?.diffuse.contents = UIColor.green
            node.position = SCNVector3(0,0,0)
            self.sceneView.scene.rootNode.addChildNode(node)
        default:
            print("Default Case")
        }
        print("scoreValue")
        
    }
    
    @IBAction func ShapeButton1(_ sender: Any) {
        if(shapeIndex == 0){
            scoreValue = scoreValue + 1
            let scoreVal = String(scoreValue)
            score.text = scoreVal
        }
        shapeIndex = Int.random(in: 0..<4)
        refreshScene(shapeIndex: shapeIndex)
        
    }
    @IBAction func ShapeButton2(_ sender: Any) {
        if(shapeIndex == 1){
            scoreValue = scoreValue + 1
            let scoreVal = String(scoreValue)
            score.text = scoreVal
            
        }
        shapeIndex = Int.random(in: 0..<4)
        refreshScene(shapeIndex: shapeIndex)
    }
    @IBAction func ShapeButton3(_ sender: Any) {
        if(shapeIndex == 2){
            scoreValue = scoreValue + 1
            let scoreVal = String(scoreValue)
            score.text = scoreVal
        }
        shapeIndex = Int.random(in: 0..<4)
        refreshScene(shapeIndex: shapeIndex)
    }
    @IBAction func ShapeButton4(_ sender: Any) {
        if(shapeIndex == 3){
            scoreValue = scoreValue + 1
            let scoreVal = String(scoreValue)
            score.text = scoreVal
        }
        shapeIndex = Int.random(in: 0..<4)
        refreshScene(shapeIndex: shapeIndex)
    }
    
    
    
    
//    @IBAction func add(_ sender: Any) {
//        let node = SCNNode()
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        node.position = SCNVector3(0,0,-0.3)
//        self.sceneView.scene.rootNode.addChildNode(node)
//    }
    
    
   
}

