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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segueMessage == 1 {
            resultLabel.text = NSLocalizedString("winnerMsg", comment: "Says Winner")
        } else if segueMessage == 2 {
            resultLabel.text = NSLocalizedString("drawMsg", comment: "Says Draw")
        } else if segueMessage == 3 {
            resultLabel.text = NSLocalizedString("loserMsg", comment: "Says Loser")
        }
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.5, execute: {
            self.performSegue(withIdentifier: "backSegue", sender: self)
        })
       
    }


}
