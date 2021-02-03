// Utils.swift

import Foundation
import WebimClientLibrary

class Utils : NSObject  {
    
    func sendEvent(name: String, body: Any?) {
        EventEmitter.sharedInstance.dispatch(name: name, body: body)
    }
    
    static func messageToJson(message: Message) -> [String:Any]{

        var map = [String:Any]()
        
        let id : String = message.getID();
        let time : String = message.getTime().datatypeValue;
        let type : String = String(describing: message.getType());
        let text : String = message.getText();
        let name : String = message.getSenderName();
        let status : String = String(describing: message.getSendStatus());
        let avatar : String = message.getSenderAvatarFullURL()?.absoluteString ?? "";
        let read : Bool = message.isReadByOperator();
        let canEdit : Bool = message.canBeEdited();
        
        map.updateValue(id, forKey: "id");
        map.updateValue(time, forKey: "time");
        map.updateValue(type, forKey: "type");
        map.updateValue(text, forKey: "text");
        map.updateValue(name, forKey: "name");
        map.updateValue(status, forKey: "status");
        map.updateValue(avatar, forKey: "avatar");
        map.updateValue(read, forKey: "read");
        map.updateValue(canEdit, forKey: "canEdit");
        
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

