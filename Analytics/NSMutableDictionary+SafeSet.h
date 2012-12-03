//
//  NSMutableDictionary+SafeSet.h
//  Analytics
//
//  Created by Maximilian Tagher on 12/2/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum NSMutableDictionaryOverwritePolicy: NSInteger {
    NSMutableDictionaryOverwritePolicyNo,
    NSMutableDictionaryOverwritePolicyOverwrite,
} NSMutableDictionaryOverwritePolicy;

/** Category to safely handle `nil` objects by replacing them with NSNull. Additionally allows you to specify if an object should be overwritten if there is one already associated with the given key. */
@interface NSMutableDictionary (SafeSet)

/** The typical setObject:forKey: method, but it use NSNull if `anObject` is `nil`. Additionally, you may specify if the call should overwrite an existing object associated with the key.
 @param anObject The object to set.
 @param aKey The key with which the object should be associated.
 @param policy Whether or not to overwrite existing objects associated with the key.
 */
- (void)safeSetObject:(id)anObject
           forKey:(id<NSCopying>)aKey
  overwritePolicy:(NSMutableDictionaryOverwritePolicy)policy;

@end
