//
//  Repo.m
//  JSONDictionaries
//
//  Created by sd79 on 2017-06-19.
//  Copyright © 2017 Glen Posey. All rights reserved.
//

#import "Repo.h"

@implementation Repo

-(id)initWithJSONData:(NSDictionary*)data{
    self = [super init];
    if(self){
        //NSLog(@"initWithJSONData method called");
        self.name =  [data objectForKey:@"name"];
            }
    return self;
}


@end
