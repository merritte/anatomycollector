//
//  AnatomyViewController.swift
//  AnatomyCollector
//
//  Created by Merritte on 10/18/16.
//  Copyright © 2016 Merritte. All rights reserved.
//

import UIKit

class AnatomyViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var anatomyImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var part : Part? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imagePicker.delegate = self
        
        if part  != nil {
            anatomyImageView.image = UIImage(data: part!.image as! Data)
            titleTextField.text = part?.name
            
            addUpdateButton.setTitle("Update", for: .normal)
        }else{
            deleteButton.isHidden = true
        }
    }
    
    @IBAction func photosTapped(_ sender: AnyObject) {
        
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as!
        UIImage
        
        anatomyImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: AnyObject) {
    }
    
    @IBAction func addTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let part = Part(context: context)
        part.name = titleTextField.text
        part.image = UIImagePNGRepresentation(anatomyImageView.image!) as NSData?
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
