//
//  DDGSettingsViewController.m
//  DuckDuckGo
//
//  Created by Ishaan Gulrajani on 7/18/12.
//  Copyright (c) 2012 DuckDuckGo, Inc. All rights reserved.
//

#import "DDGSettingsViewController.h"
#import "DDGCache.h"
#import "DDGNewsSourcesViewController.h"

@implementation DDGSettingsViewController

+(void)loadDefaultSettings {
    NSDictionary *defaults = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES], @"history",
                              [NSNumber numberWithBool:NO], @"quack",
                              nil];
    
    for(NSString *key in defaults) {
        if(![DDGCache objectForKey:key inCache:@"settings"])
            [DDGCache setObject:[defaults objectForKey:key] 
                         forKey:key 
                        inCache:@"settings"];
    }
}

-(void)configure {
    self.title = @"Settings";
    
    [self addSectionWithTitle:@"General"];
    [self addSwitch:@"Record history" enabled:[[DDGCache objectForKey:@"history" inCache:@"settings"] boolValue]];
    [self addSwitch:@"Enhanced audio effects" enabled:[[DDGCache objectForKey:@"quack" inCache:@"settings"] boolValue]];

    [self addSectionWithTitle:@"News"];
    [self addButton:@"Configure news sources" action:^{
        DDGNewsSourcesViewController *sourcesVC = [[DDGNewsSourcesViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:sourcesVC animated:YES];
    }];
}

-(void)saveData:(NSDictionary *)formData {
    [DDGCache setObject:[formData objectForKey:@"Record history"] 
                 forKey:@"history" 
                inCache:@"settings"];
    
    [DDGCache setObject:[formData objectForKey:@"Enhanced audio effects"] 
                 forKey:@"quack" 
                inCache:@"settings"];
}

@end