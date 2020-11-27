//
//  StartHabitViewController.swift
//  StartHabit
//
//  Created by claudine  on 11/27/20.
//

import UIKit

class StartHabitViewController: UIViewController {
    
    
    @IBOutlet weak var NameButton: UITextField!
    
    @IBOutlet weak var CategoryButton: UILabel!
    
    @IBOutlet weak var MentalButton: UIButton!
    
    @IBOutlet weak var PhysicalButton: UIButton!
    
    @IBOutlet weak var EmotionalButton: UIButton!
    
    @IBOutlet weak var SpiritualButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()

        // Do any additional setup after loading the view.
    }
    
    func configureButtons(){
        
        NameButton.layer.cornerRadius = 0.5 * NameButton.bounds.size.width
        NameButton.clipsToBounds = true
        
        CategoryButton.layer.cornerRadius = 0.5 * CategoryButton.bounds.size.width
        CategoryButton.clipsToBounds = true
        
        MentalButton.layer.cornerRadius = 0.5 * MentalButton.bounds.size.width
        MentalButton.clipsToBounds = true
        
        PhysicalButton.layer.cornerRadius = 0.5 * PhysicalButton.bounds.size.width
        PhysicalButton.clipsToBounds = true
        
        EmotionalButton.layer.cornerRadius = 0.5 * EmotionalButton.bounds.size.width
        EmotionalButton.clipsToBounds = true
        
        SpiritualButton.layer.cornerRadius = 0.5 * SpiritualButton.bounds.size.width
        SpiritualButton.clipsToBounds = true
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
