//
//  ViewController.m
//  JSONMappingDome
//
//  Created by 陈明超 on 15/7/24.
//  Copyright (c) 2015年 陈明超. All rights reserved.
//

#import "ViewController.h"
#import "TestObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *testObjectArray=[NSArray arrayWithObjects:@"num1",@"num2",@"num3", nil];
    NSDictionary *tDic=[[NSDictionary alloc]initWithObjectsAndKeys:testObjectArray,@"TestArray", nil];
    
    NSDictionary *testDicClassObject=[NSDictionary dictionaryWithObjectsAndKeys:@"jeck",@"userName", nil];
    NSArray *testDicClass=[NSArray arrayWithObjects:testDicClassObject, nil];
    
    NSMutableDictionary *testDataDictionary=[[NSMutableDictionary alloc]init];
    [testDataDictionary setObject:tDic forKey:@"TDIC"];
    [testDataDictionary setObject:@"时间" forKey:@"Time"];
    [testDataDictionary setObject:@"2015-07-22" forKey:@"Date"];
    [testDataDictionary setObject:testDicClass forKey:@"TestDicClassArray"];
    [testDataDictionary setObject:[NSNumber numberWithDouble:1.3] forKey:@"doubleNum"];
    [testDataDictionary setObject:[NSNumber numberWithFloat:3.6] forKey:@"intargetNum"];
    
    NSError *err;
    NSData *jsonData=[NSJSONSerialization dataWithJSONObject:testDataDictionary options:NSJSONWritingPrettyPrinted error:&err ];//[[NSString stringWithFormat:@"{\"Time\":\"时间\"}"] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *jsonString=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"jsonString=%@",jsonString);
    
    TestObject *test=[[TestObject alloc]init];
    test=[NetWorkingDataMapping NetWorkingDataMapping:jsonData JsonMessageDic:nil AndReceiveObject:test];
    NSLog(@"test=%@",test);
    NSLog(@"test.Time=%@",test.Time);
    NSLog(@"test.TDIC=%@",test.TDIC);
    NSLog(@"test.TDIC.TestArray=%@",test.TDIC.TestArray);
    NSLog(@"test.TestDicClassArray=%@",test.TestDicClassArray);
    NSLog(@"test.TestDicClass.userName=%@",[(TestDicClass *)[test.TestDicClassArray objectAtIndex:0] userName]);
    NSLog(@"test.doubleNum=%@",test.doubleNum);
    NSLog(@"test.intargetNum=%@",test.intargetNum);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
