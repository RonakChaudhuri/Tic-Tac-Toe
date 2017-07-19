//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ronak Chaudhuri on 6/15/17.
//  Copyright © 2017 Ronak Chaudhuri. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
 
    @IBOutlet weak var gridView: UIView!
    @IBOutlet weak var labelOne: GridLabel!
    @IBOutlet weak var labelTwo: GridLabel!
    @IBOutlet weak var labelThree: GridLabel!
    @IBOutlet weak var labelFour: GridLabel!
    @IBOutlet weak var labelFive: GridLabel!
    @IBOutlet weak var labelSix: GridLabel!
    @IBOutlet weak var labelSeven: GridLabel!
    @IBOutlet weak var labelEight: GridLabel!
    @IBOutlet weak var labelNine: GridLabel!
    @IBOutlet weak var myTurnLabel: UILabel!
    
    
    var myGrid = GridLabel()
    var labelsArray:[GridLabel] = []

    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        labelsArray = [labelOne,labelTwo,labelThree,labelFour,labelFive,labelSix,labelSeven,labelEight,labelNine]
        
       
    }
    @IBAction func gridTapped(_ sender: UITapGestureRecognizer)
    {
        print("Tapped Somewhere")
        for label in labelsArray
        {
           
            if label.frame.contains(sender.location(in: gridView))
            {
                if label.canTap == true
                {
                   if myGrid.xTurn == true
                   {
                    
                    
                    //label.backgroundColor = UIColor(patternImage:UIImage(named: "Trump")!)
                    label.text = "X"
                    label.font = UIFont(name: "Noteworthy", size: 50)
                    label.canTap = false
                        myGrid.count += 1
                        myTurnLabel.text = "Player Two"
                    
                    }
                    else
                    {
                        //label.backgroundColor = UIColor(patternImage:UIImage(named: "Putin")!)
                        label.text = "O"
                        label.font = UIFont(name: "Noteworthy", size: 50)
                        label.canTap = false
                        myGrid.count += 1
                        myTurnLabel.text = "Player One"
                    }
                   myGrid.xTurn = !myGrid.xTurn
                }
            
                
        }
        
        }
         checkWinner()
        
    }
       func checkWinner()
       {
        
        if labelOne.text == labelTwo.text && labelTwo.text == labelThree.text && labelOne.text != ""
        {
            print("Winner")
            winner(winner: labelOne.text!)
            
            
            
        }
        if labelFour.text == labelFive.text && labelFive.text == labelSix.text && labelFour.text != ""
        {
            print("Winner")
            winner(winner: labelFour.text!)
            
            
            
            
        }
        if labelSeven.text == labelEight.text && labelEight.text == labelNine.text && labelSeven.text != ""
        {
            print("Winner")
            winner(winner: labelSeven.text!)
            
            
            
            
        }
        if labelOne.text == labelFour.text && labelFour.text == labelSeven.text && labelOne.text != ""
        {
            print("Winner")
            winner(winner: labelOne.text!)
            
            
            
        }
        if labelTwo.text == labelFive.text && labelFive.text == labelEight.text && labelTwo.text != ""
        {
            print("Winner")
            winner(winner: labelTwo.text!)
            
            
            
        }
        if labelThree.text == labelSix.text && labelSix.text == labelNine.text && labelThree.text != ""
        {
            print("Winner")
            winner(winner: labelThree.text!)
            
            
            
        }
        if labelOne.text == labelFive.text && labelFive.text == labelNine.text && labelOne.text != ""
        {
            print("Winner")
          winner(winner: labelOne.text!)
            
            
            
        }
        if labelThree.text == labelFive.text && labelFive.text == labelSeven.text && labelThree.text != ""
        {
            print("Winner")
           winner(winner: labelThree.text!)
            
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
    
}
