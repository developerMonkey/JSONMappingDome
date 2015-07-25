//
//  RkyShineUponOperation.h
//  EasyJieApp
//
//  Created by easy011 on 15/5/28.
//  Copyright (c) 2015年 easyjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface RkyShineUponOperation : NSObject
/**********获取属性名数组***********/
//className是实例话后有值的对象
+(NSMutableArray *)getPropertyList:(id)className;

/**********获取对象名称**********/
//className是实例话后有值的对象
+(NSString *)getClassName:(id)className;
@end
