//
//  WatchOSConnector.swift
//  Wice
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/23.
//

import Foundation
import WatchConnectivity

class WatchOSConnector : NSObject, WCSessionDelegate{
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    
}
