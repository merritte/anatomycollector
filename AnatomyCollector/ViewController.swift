//
//  ViewController.swift
//  AnatomyCollector
//
//  Created by Merritte on 10/9/16.
//  Copyright © 2016 Merritte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var partTableView: UITableView!
    
    var parts : [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        partTableView.dataSource = self
        partTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            parts = try context.fetch(Part.fetchRequest())
            partTableView.reloadData()
            
        } catch {
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let part = parts[indexPath.row]
        cell.textLabel?.text = part.name
        cell.imageView?.image = UIImage(data: part.image as! Data)
        return cell
    }
    
    
    
}

