//
//  WatchOSConnector.swift
//  WiceOS Watch App
//
//  Created by Marcel Felipe Gottardi Anesi on 11/09/23.
//

import Foundation
import WatchConnectivity
import SwiftUI

class WatchOSConnector : NSObject, WCSessionDelegate, ObservableObject{
    
    var session: WCSession
    
    @Published var currentImageIndex: Int = 0
    @Published var imageList: [UIImage] = []
    
    init(WCSession: WCSession = .default){
        session = WCSession
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if let imageData = message["image"] as? Data, let image = UIImage(data: imageData){
                self.imageList.append(image)
                self.forwardImage()
            }
        }
    }
    
}

// MARK: - Functions
extension WatchOSConnector {
    
    func backwardImage() {
        if !imageList.isEmpty {
            currentImageIndex = (currentImageIndex - 1 + imageList.count) % imageList.count
        }
    }
    
    func forwardImage() {
        if !imageList.isEmpty {
            currentImageIndex = (currentImageIndex + 1) % imageList.count
        }
    }
    
    func getImage() -> UIImage {
        if !imageList.isEmpty {
            return imageList[currentImageIndex]
        }
        return UIImage()
    }
}

