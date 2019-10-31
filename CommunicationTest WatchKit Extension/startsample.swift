//
//  startsample.swift
//  CommunicationTest WatchKit Extension
//
//  Created by MacStudent on 2019-10-31.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import WatchKit
import WatchConnectivity




class startsample  : WKInterfaceController, WCSessionDelegate {
    
    // MARK: Outlets
    // ---------------------
    
    // 1. Outlet for the image view
    var health: CGFloat = 1.0
    
    
    @IBOutlet var ScoreLbl: WKInterfaceLabel!
    
    @IBOutlet var pokemonImageView: WKInterfaceImage!
    
    // 2. Outlet for the label
    @IBOutlet var nameLabel: WKInterfaceLabel!
    
    // MARK: Delegate functions
    // ---------------------
    
    // Default function, required by the WCSessionDelegate on the Watch side
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //@TODO
    }
    
    // MARK: WatchKit Interface Controller Functions
    // ----------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        // 1. Check if the watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // MARK: Actions
    @IBAction func startButtonPressed() {
        print("Start button pressed")
    }
    
    
    @IBAction func selectNameButtonPressed()
    {
        let suggestedResponses = ["pikachu", "caterpie"]
        presentTextInputController(withSuggestions: suggestedResponses, allowedInputMode: .plain) {
            
            (results) in
            
            
            if (results != nil && results!.count > 0) {
                
                
                // 2. write your code to process the person's response
                let userResponse = results?.first as? String
                self.nameLabel.setText(userResponse)
            }
        }
        
        print("select name button pressed")
    }
    
    
}

