//
//  NetWorkingDataMapping.m
//  CustomerLibrary
//
//  Created by 陈明超 on 15/7/21.
//  Copyright (c) 2015年 陈明超. All rights reserved.
//

#import "NetWorkingDataMapping.h"
static NSMutableArray *objectArray;
@implementation NetWorkingDataMapping

+(id)NetWorkingDataMapping:(NSData *)jsonData JsonMessageDic:(NSDictionary *)jsonDictionary AndReceiveObject:(id)receiveObject
{
    
    
    NSError *err=nil;
    if (jsonData!=nil&&jsonDictionary==nil)
    {
        jsonDictionary=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:&err];
    }
    
    NSArray *objectPropertys=[RkyShineUponOperation getPropertyList:receiveObject];
    
    for (NSInteger num=0; num<[objectPropertys count]; num++)
    {
        NSString *propretyName=[objectPropertys objectAtIndex:num];
        
        id value=[jsonDictionary objectForKey:propretyName];
        if ([value isKindOfClass:[NSString class]]||[value isKindOfClass:[NSNumber class]]||[value isKindOfClass:[NSData class]])
        {
            [receiveObject setValue:value forKey:propretyName];
        }
        
        if ([value isKindOfClass:[NSArray class]])
        {
            NSMutableArray *valueArray=[[NSMutableArray alloc]init];
            for (id object in value)
            {
                if ([object isKindOfClass:[NSString class]]||[object isKindOfClass:[NSNumber class]]||[object isKindOfClass:[NSData class]])
                {
                    [valueArray addObject:object];
                }
                if ([object isKindOfClass:[NSDictionary class]])
                {
                    NSString *dicClassName=[RkyCheckString subStringTargetString:propretyName AndReferenceString:@"Array"];
                    Class class=NSClassFromString(dicClassName);
                    id instance = [[class alloc] init];
                    instance=[self NetWorkingDataMapping:nil JsonMessageDic:object AndReceiveObject:instance];
                    [valueArray addObject:instance];
                }
            }
            [receiveObject setValue:valueArray forKey:propretyName];
        }
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            Class class=NSClassFromString(propretyName);
            id instance = [[class alloc] init];
            instance=[self NetWorkingDataMapping:nil JsonMessageDic:value AndReceiveObject:instance];
            [receiveObject setValue:instance forKey:propretyName];
        }
    }
    
    return receiveObject;
}

@end
