// Utils.swift

import Foundation
import WebimClientLibrary

class Utils : NSObject  {
    
    func sendEvent(name: String, body: Any?) {
        EventEmitter.sharedInstance.dispatch(name: name, body: body)
    }
    
    static func messageToJson(message: Message) -> [String:Any]{

        var map = [String:Any]()
        map.updateValue(message.getID(), forKey: "id");
        map.updateValue(message.getTime(), forKey: "time");
        map.updateValue(message.getType(), forKey: "type");
        map.updateValue(message.getText(), forKey: "text");
        map.updateValue(message.getSenderName(), forKey: "name");
        map.updateValue(message.getSendStatus(), forKey: "status");
        map.updateValue(message.getSenderAvatarFullURL(), forKey: "avatar");
        map.updateValue(message.isReadByOperator(), forKey: "read");
        map.updateValue(message.canBeEdited(), forKey: "canEdit");
        
        return map;
    }
    
    static func messagesToJson(messages: [Message]) -> [String:Any]{

        var map = [String:Any]()
        var jsonArray = [[String:Any]]();
        
        for message in messages {
            jsonArray.append(messageToJson(message: message));
        }
        
        map.updateValue(jsonArray, forKey: "messages")
        
        return map;
    }
}

