//
//  NormalTrackHabitViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 12/8/20.
//

import UIKit
import SwiftUI
import Firebase

class NormalTrackHabitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrackToCompose" {
            guard segue.destination is ComposeViewController else { return }

        }
    
    }

    
    @IBSegueAction func toCustomUI(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: UITrackHabit())
    }
    @IBAction func toCompose(_ sender: Any) {
        performSegue(withIdentifier: "TrackToCompose", sender: self)
    }
    
}
