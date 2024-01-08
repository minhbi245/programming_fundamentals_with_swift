//: [Previous](@previous)

import UIKit

let str = NSMutableAttributedString()
let para = NSMutableParagraphStyle()

para.headIndent = 10
para.firstLineHeadIndent = 10

str.addAttribute(.paragraphStyle,
                 value: para, range: NSRange(location: 0, length: 1))

str.addAttribute(.paragraphStyle,
                 value: {
    let para1 = NSMutableParagraphStyle()
    para1.headIndent = 10
    para1.firstLineHeadIndent = 10
    
    return para1
}()
                 , range: NSRange(location: 0, length: 1))

