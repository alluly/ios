//
//  DDGStoryCell.m
//  DuckDuckGo
//
//  Created by Johnnie Walker on 12/02/2013.
//
//

#import "DDGStoryCell.h"

@implementation DDGStoryCell

- (void)layoutSubviews {
    self.contentView.frame = self.contentView.superview.bounds;
}

@end
