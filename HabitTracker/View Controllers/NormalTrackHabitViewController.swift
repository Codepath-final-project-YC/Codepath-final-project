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
    

    @IBSegueAction func CustomUIAction(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: UITrackHabit())
    }
}
