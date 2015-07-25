//
//  RkyCheckString.h
//  CustomerLibrary
//
//  Created by 陈明超 on 15/7/22.
//  Copyright (c) 2015年 陈明超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RkyCheckString : NSObject

/*********截取指定字符串前的字符串*********/
+(NSString *)subStringTargetString:(NSString *)targetString AndReferenceString:(NSString *)referenceString;
@end
