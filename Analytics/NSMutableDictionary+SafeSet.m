//
//  NSMutableDictionary+SafeSet.m
//  Analytics
//
//  Created by Maximilian Tagher on 12/2/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "NSMutableDictionary+SafeSet.h"

@implementation NSMutableDictionary (SafeSet)

- (void)safeSetObject:(id)anObject
               forKey:(id<NSCopying>)aKey
      overwritePolicy:(NSMutableDictionaryOverwritePolicy)policy
{
    if (![self objectForKey:aKey] || policy == NSMutableDictionaryOverwritePolicyOverwrite) {
        anObject ? ([self setObject:anObject forKey:aKey]) : ([self setObject:[NSNull null] forKey:aKey]);
    }
}

@end
