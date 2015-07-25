//
//  RkyCheckString.m
//  CustomerLibrary
//
//  Created by 陈明超 on 15/7/22.
//  Copyright (c) 2015年 陈明超. All rights reserved.
//

#import "RkyCheckString.h"

@implementation RkyCheckString
+(BOOL)checkStringHaveAnalyzingSpecialCharacters:(NSString *)targetString AndAnalyzingSpecialCharacters:(NSString *)analyzingSpecialCharacters
{
    BOOL haveAnalyzingSpecialCharacters=NO;
    if ([targetString rangeOfString:analyzingSpecialCharacters].location!=NSNotFound)
    {
        haveAnalyzingSpecialCharacters=YES;
    }
    return haveAnalyzingSpecialCharacters;
}

/*********截取指定字符串前的字符串*********/
+(NSString *)subStringTargetString:(NSString *)targetString AndReferenceString:(NSString *)referenceString
{
    NSRange range=[targetString rangeOfString:referenceString];
    targetString=[targetString substringToIndex:range.location];
    return targetString;
}

@end
