//
//  SecondViewController.swift
//  Tic Tac Toe
//
//  Created by Ronak Chaudhuri on 6/16/17.
//  Copyright © 2017 Ronak Chaudhuri. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var cpuGridView: UIView!
    @IBOutlet weak var cpuLabelOne: GridLabel!
    @IBOutlet weak var cpuLabelTwo: GridLabel!
    @IBOutlet weak var cpuLabelThree: GridLabel!
    @IBOutlet weak var cpuLabelFour: GridLabel!
    @IBOutlet weak var cpuLabelFive: GridLabel!
    @IBOutlet weak var cpuLabelSix: GridLabel!
    @IBOutlet weak var cpuLabelSeven: GridLabel!
    @IBOutlet weak var cpuLabelEight: GridLabel!
    @IBOutlet weak var cpuLabelNine: GridLabel!
   
   
    var myGrid = GridLabel()
    var labelsArray:[GridLabel] = []
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [cpuLabelOne,cpuLabelTwo,cpuLabelThree,cpuLabelFour,cpuLabelFive,cpuLabelSix,cpuLabelSeven,cpuLabelEight,cpuLabelNine]
        
        
    }
    
    @IBAction func secondTapGesture(_ sender: UITapGestureRecognizer)
    
    
    {
        print("Tapped Somewhere")
        for label in labelsArray
        {
            
            if label.frame.contains(sender.location(in: cpuGridView))
            {
                if label.canTap == true
                {
                    if myGrid.xTurn == true
                    {
                        
                        
                        
                        label.text = "X"
                        label.font = UIFont(name: "Noteworthy", size: 50)
                        print("x marked")
                        label.canTap = true
                        label.xTurn = false
                        

                        
                    }

                }
                
                
            }
            
        }
        
        computerMove()
        checkWinner()
        
    }
    func checkWinner()
    {
        
        if cpuLabelOne.text == cpuLabelTwo.text && cpuLabelTwo.text == cpuLabelThree.text && cpuLabelOne.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelOne.text!)
            
            
            
        }
        if cpuLabelFour.text == cpuLabelFive.text && cpuLabelFive.text == cpuLabelSix.text && cpuLabelFour.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelFour.text!)
            
            
            
            
        }
        if cpuLabelSeven.text == cpuLabelEight.text && cpuLabelEight.text == cpuLabelNine.text && cpuLabelSeven.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelSeven.text!)
            
            
            
            
        }
        if cpuLabelOne.text == cpuLabelFour.text && cpuLabelFour.text == cpuLabelSeven.text && cpuLabelOne.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelOne.text!)
            
            
            
        }
        if cpuLabelTwo.text == cpuLabelFive.text && cpuLabelFive.text == cpuLabelEight.text && cpuLabelTwo.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelTwo.text!)
            
            
            
        }
        if cpuLabelThree.text == cpuLabelSix.text && cpuLabelSix.text == cpuLabelNine.text && cpuLabelThree.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelThree.text!)
            
            
            
        }
        if cpuLabelOne.text == cpuLabelFive.text && cpuLabelFive.text == cpuLabelNine.text && cpuLabelOne.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelOne.text!)
            
            
            
        }
        if cpuLabelThree.text == cpuLabelFive.text && cpuLabelFive.text == cpuLabelSeven.text && cpuLabelThree.text != ""
        {
            print("Winner")
            winner(winner: cpuLabelThree.text!)
            
        }
        if myGrid.count >= 9
        {
            print("cat's game")
            winner(winner: "The Cat")
        }
    }
    func winner(winner:String)
    {
        let alert = UIAlertController(title: winner + " is the Winner!", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        
        let resetButton = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: {sender in
            
            // interates through array and resets all labels
            for labels in self.labelsArray
            {
                labels.text = ""
                labels.canTap = true
            }
            self.myGrid.xTurn = true
            self.myGrid.count = 0
        })
        alert.addAction(resetButton)
        present(alert, animated: true, completion: nil)
    }
    
    func computerMove()
    {
        
        print("Tapped Somewhere")
       
        for label in labelsArray
        {
           
            if label.text == ""
            {
            var randomLabel = Int(
                (arc4random_uniform(UInt32(labelsArray.count))))
            
            
        
            
            if myGrid.xTurn == true
            {
                if label.canTap == true
                {
                    label.text = "O"
                    label.font = UIFont(name: "Noteworthy", size: 50)
                    print("o marked")
                    label.canTap = true
                    label.xTurn = false
                    break
                }

            }
            
            
                
            
        
            }
    
        }
}
}
