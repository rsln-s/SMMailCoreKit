//
//  SMMailCoreWrapper.swift
//  SMMailCoreKit
//
//  Created by Руслан on 01.11.15.
//  Copyright © 2015 MIPT. All rights reserved.
//

import Foundation
import MailCore

@objc (SMMailCoreWrapper) public class MailCoreWrapper:NSObject, NSSecureCoding{
    public var message:MCOIMAPMessage
    public var data:NSData
    public var mailType:SMMailType
    
    public init(_message: MCOIMAPMessage, _data: NSData, _mailType:SMMailType){
        self.message = _message
        self.data = _data
        self.mailType = _mailType
    }
    
    public required convenience init(coder aDecoder: NSCoder) {
        //        self.init()
        let _message = aDecoder.decodeObjectOfClass(MCOIMAPMessage.self, forKey: "message")!
        let _data = aDecoder.decodeObjectOfClass(NSData.self, forKey: "data")!
        //        let _mailType = aDecoder.decodeObjectOfClass(SMMailType.self, forKey: "mailType")
        let _mailType = SMMailType(rawValue: aDecoder.decodeIntegerForKey("mailType"))!
        self.init(_message: _message, _data: _data, _mailType: _mailType)
    }
    
    public class func supportsSecureCoding() -> Bool {
        return true
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.message, forKey: "message")
        aCoder.encodeObject(self.data, forKey: "data")
        aCoder.encodeObject(self.mailType.rawValue, forKey: "mailType")
    }
}