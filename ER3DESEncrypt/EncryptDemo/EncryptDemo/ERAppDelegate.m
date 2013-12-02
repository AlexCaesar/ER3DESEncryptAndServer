//
//  ERAppDelegate.m
//  EncryptDemo
//
//  Created by Er.Z on 13-12-2.
//  Copyright (c) 2013年 erblah.com. All rights reserved.
//

#import "ERAppDelegate.h"
#import "ER3DESEncrypt.h"
#import "NSString+Encrypt3DESandBase64.h"

@implementation ERAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSString *orig = @"www.erblah.com", *encryptString, *decryptString, *key = @"I love you.";
    
    //////////////////////////////////////////////
    // use default key: abcd12345678901234567890
    //////////////////////////////////////////////
    ER3DESEncrypt *encryptDefaultKey = [[ER3DESEncrypt alloc] init];
    
    orig = @"www.erblah.com";
    encryptString = [encryptDefaultKey encryptString:orig];
    decryptString = [encryptDefaultKey decryptString:encryptString];
    NSLog(@"key:%@\n%@ --- %@ --- %@",encryptDefaultKey.encryptKey, orig, encryptString, decryptString);
    
    //////////////////////////////////////////////
    // use custom key
    //////////////////////////////////////////////
    ER3DESEncrypt *encryptCustomKey = [[ER3DESEncrypt alloc] initWithKey:key];
    
    encryptString = [encryptCustomKey encryptString:orig];
    decryptString = [encryptCustomKey decryptString:encryptString];
    NSLog(@"key:%@\n%@ --- %@ --- %@",encryptDefaultKey.encryptKey, orig, encryptString, decryptString);
    
    //////////////////////////////////////////////
    // use category
    //////////////////////////////////////////////
    encryptString = [orig encryptStringWithKey:key];
    decryptString = [encryptString decryptStringWithKey:key];
    NSLog(@"key:%@\n%@ --- %@ --- %@", key, orig, encryptString, decryptString);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
