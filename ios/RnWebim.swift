// RnWebim.swift

import Foundation
import WebimClientLibrary

@objc(RnWebim)
class RnWebim : NSObject  {
    
    private var jsPromiseResolver: RCTPromiseResolveBlock? = nil;
    private var jsPromiseRejecter: RCTPromiseRejectBlock? = nil;
    
   
    
    @objc
    func resume(
        _ params: NSDictionary?,
        withResolver resolve: @escaping RCTPromiseResolveBlock,
        withRejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
        
        jsPromiseResolver = resolve;
        jsPromiseRejecter = reject;
      
        DispatchQueue.main.async {
                
            do {
                let webimSession = try Webim.newSessionBuilder().set(accountName: "ACCOUNT_NAME").set(location: "LOCATION_NAME").build()
              

                if (self.jsPromiseResolver != nil) {
                    self.jsPromiseResolver!(String(format: "since ok"))
                }
            } catch {
               
                   
            }
                  
        }
    }
}

