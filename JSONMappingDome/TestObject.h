//
//  TestObject.h
//  TestViewChange
//
//  Created by 陈明超 on 15/7/22.
//  Copyright (c) 2015年 陈明超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDIC.h"
#import "TestDicClass.h"
@interface TestObject : NSObject
@property(strong,nonatomic)NSString *Date;
@property(strong,nonatomic)TDIC *TDIC;
@property(strong,nonatomic)NSString *Time;
@property(strong,nonatomic)NSArray *TestDicClassArray;
@property(strong,nonatomic)NSNumber *doubleNum;
@property(strong,nonatomic)NSNumber *intargetNum;
@end
