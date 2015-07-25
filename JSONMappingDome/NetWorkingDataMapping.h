//
//  NetWorkingDataMapping.h
//  CustomerLibrary
//
//  Created by 陈明超 on 15/7/21.
//  Copyright (c) 2015年 陈明超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RkyShineUponOperation.h"
#import "RkyCheckString.h"
@interface NetWorkingDataMapping : NSObject

/********网络请求数据*********/
/*
 *method name +(id)NetWorkingDataMapping:
 *prama (NSData *)jsonData 要解析的json 数据
 *
 */
+(id)NetWorkingDataMapping:(NSData *)jsonData JsonMessageDic:(NSDictionary *)jsonDictionary AndReceiveObject:(id)receiveObject;
@end
