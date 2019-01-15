//
//  ResultViewController.swift
//  BlackJack
//
//  Created by Oscar Sandahl on 2019-01-15.
//  Copyright © 2019 Oscar Sandahl. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        activeBet = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segueMessage == 1 {
            resultLabel.text = "Winner!"
        } else if segueMessage == 2 {
            resultLabel.text = "Draw."
        } else if segueMessage == 3 {
            resultLabel.text = "Looser.."
        }
       
    }


}
