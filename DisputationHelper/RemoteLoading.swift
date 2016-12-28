//
//  RemoteLoading.swift
//  DisputationHelper
//
//  Created by Jack Frysinger on 12/27/16.
//  Copyright © 2016 Jack Frysinger. All rights reserved.
//

import Foundation

class RemoteLoading {
    
    let key: String
    var delegate: RemoteLoadingDelegate?
    
    init(key: String) {
        self.key = key
    }
    
    func load() {
        let url = URL(string: "\(self.key).jackfrysinger.com")!
        let task = URLSession().dataTask(with: url, completionHandler: {(data, response, error) in self.handle(data: data)})
        task.resume()
    }
    
    func handle(data: Data?) {
        // fun stuff
        
        // feed back into the delegate
    }
}

protocol RemoteLoadingDelegate {
    func recievedDisputation(disputation: Disputation)
}
