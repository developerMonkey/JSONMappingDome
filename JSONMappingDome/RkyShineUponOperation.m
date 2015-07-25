//
//  RkyShineUponOperation.m
//  EasyJieApp
//
//  Created by easy011 on 15/5/28.
//  Copyright (c) 2015年 easyjie. All rights reserved.
//

#import "RkyShineUponOperation.h"

@implementation RkyShineUponOperation
/**********获取属性名数组***********/
+(NSMutableArray *)getPropertyList:(id)className
{
    NSMutableArray *propertyArray=[[NSMutableArray alloc]init];
    unsigned int propertyCount;
    unsigned int tempNum;
    objc_property_t *properties=class_copyPropertyList([className class], &propertyCount);
    for (tempNum=0; tempNum<propertyCount; tempNum++)
    {
        objc_property_t propert=properties[tempNum];
        NSString *propertyName=[[NSString alloc]initWithCString:property_getName(propert) encoding:NSUTF8StringEncoding];
        [propertyArray addObject:propertyName];
    }
    NSLog(@"propertyArray=%@",propertyArray);
    return propertyArray;
}

/**********获取对象名称**********/
//className是实例话后有值的对象
+(NSString *)getClassName:(id)className
{
    NSString *classNameString;
    classNameString=[NSString stringWithCString:object_getClassName(className) encoding:NSUTF8StringEncoding];
    NSLog(@"classNameString=%@",classNameString);
    return classNameString;
}
    
@end
