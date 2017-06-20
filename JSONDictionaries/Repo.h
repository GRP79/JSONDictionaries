//
//  Repo.h
//  JSONDictionaries
//
//  Created by sd79 on 2017-06-19.
//  Copyright © 2017 Glen Posey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repo : NSObject

@property (nonatomic) NSString * repoId;
@property (nonatomic) NSString * name;
@property (nonatomic) NSString * fullname;


-(id)initWithJSONData:(NSDictionary*)data;


@end
