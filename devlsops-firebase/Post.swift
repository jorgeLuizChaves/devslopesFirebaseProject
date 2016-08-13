//
//  Post.swift
//  devlsops-firebase
//
//  Created by jorge on 8/11/16.
//  Copyright © 2016 Jorge Luiz. All rights reserved.
//

import Foundation

class Post {
    
    private var _authorUlrImg: String?
    private var _authorName: String = ""
    private var _authorKey: String = ""
    private var _excerpt: String = ""
    private var _imgUrl: String?
    private var _title: String = ""
    private var _likes: Int = 0
    
    var authorUlrImg: String? {
        set{
            _authorUlrImg = newValue
        }
        
        get{
            return _authorUlrImg
        }
    }
    
    var authorName: String {
        set{
            _authorName = newValue
        }
        
        get{
            return _authorName
        }
    }
    
    var authorKey: String {
        set{
            self._authorKey = newValue
        }
        
        get{
            return self._authorKey
        }
    }
    
    var excerpt: String {
        set{
            self._excerpt = newValue
        }
        
        get{
            return self._excerpt
        }
    }
    
    var imgUrl: String? {
        set{
            self._imgUrl = newValue
        }
        
        get{
            return self._imgUrl
        }
    }
    
    var title: String {
        set{
            self._title = newValue
        }
        
        get{
            return self._title
        }
    }
    
    var likes: Int {
        set{
            self._likes = newValue
        }
        
        get{
            return self._likes
        }
    }

    
}