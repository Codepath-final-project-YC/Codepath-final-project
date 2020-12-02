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
            guard let vc1 = segue.destination as? CALayerViewController else { return }

        }
        if segue.identifier == "goToComposeVC" {
            guard let vc2 = segue.destination as? ComposeViewController else { return }

        }
        
        if segue.identifier == "goToTrackHabitVC" {
            guard let vc3 = segue.destination as? TrackHabitViewController else { return }

        }
        if segue.identifier == "goToAnalyzeHabit" {
            guard let vc4 = segue.destination as? AnalyzeHabitViewController else { return }

        }
    }


    @IBAction func drawCate1Button(_ sender: Any) {
        performSegue(withIdentifier: "goToCALayerScene", sender: self)
    }
    
    @IBAction func ToStartHabitButton(_ sender: Any) {
        performSegue(withIdentifier: "goToComposeVC", sender: self)
    }
    
    @IBAction func trackHabitButton(_ sender: Any) {
        performSegue(withIdentifier: "goToTrackHabitVC", sender: self)

    }
    @IBAction func AnalyzeHabitButton(_ sender: Any) {
        performSegue(withIdentifier: "goToAnalyzeHabit", sender: self)
    }
}
