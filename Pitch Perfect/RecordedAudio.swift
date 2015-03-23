//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Habib, Ahsan on 3/17/15.
//  Copyright (c) 2015 Habib, Ahsan. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init( fPath:NSURL, fTitle:String)
    {
        filePathUrl = fPath
        title = fTitle
    
    }
}