//
//  ViewController.swift
//  PaintR
//
//  Created by Robert Stjacques Jr on 11/14/16.
//  Copyright © 2016 Mobile Application Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var surface: Surface!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        surface.setCurrentDrawingTool(drawingTool: .LINE)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: get image/photo functions
    
    @IBAction func choosePhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        surface.addImage(image: image)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: chnge drawing tool

    @IBAction func setDrawingToolToLine(_ sender: Any) {
        surface.setCurrentDrawingTool(drawingTool: .LINE)
    }
    
    @IBAction func setDrawingToolToSquiggle(_ sender: Any) {
        
        surface.setCurrentDrawingTool(drawingTool: .SQUIGGLE)
    }

    @IBAction func setDrawingToolToCircle(_ sender: Any) {
        surface.setCurrentDrawingTool(drawingTool: .CIRCLE)
    }
    
    @IBAction func setDrawingToolToLasso(_ sender: Any) {
        surface.setCurrentDrawingTool(drawingTool: .LASSO)
    }
    
    @IBAction func eraseSurface(_ sender: Any) {
        surface.erase()
    }
    
    // MARK: change color tools
    
    @IBAction func setColorToRed(_ sender: Any) {
        surface.paintColor = UIColor.red
    }
    
    @IBAction func setColorToYellow(_ sender: Any) {
        surface.paintColor = UIColor.yellow
    }
    
    @IBAction func setColorToGreen(_ sender: Any) {
        surface.paintColor = UIColor.green
    }
    
    @IBAction func setColorToPurple(_ sender: Any) {
        surface.paintColor = UIColor.purple
    }
    
    @IBAction func setColorToBlue(_ sender: Any) {
        surface.paintColor = UIColor.blue
    }
    
    @IBAction func setColorToBlack(_ sender: Any) {
        surface.paintColor = UIColor.black
    }
    @IBAction func setColorToWhite(_ sender: Any) {
        surface.paintColor = UIColor.white
    }
}

