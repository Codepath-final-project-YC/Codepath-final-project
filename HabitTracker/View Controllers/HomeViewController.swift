//
//  HomeViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 11/24/20.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var cate1Button: UIButton!
    @IBOutlet weak var drawView: drawSketch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCALayerScene" {
            guard let vc = segue.destination as? CALayerViewController else { return }
            
        }
    }


    @IBAction func drawCate1Button(_ sender: Any) {
        performSegue(withIdentifier: "goToCALayerScene", sender: self)
    }
}
