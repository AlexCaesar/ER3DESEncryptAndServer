//
//  ER3DESEncrypt.m
//
//  Created by Er.Z on 13-12-2.
//
//  Licensed under the Apache License, Version 2.0 (the "License"); you may not
//  use this file except in compliance with the License.  You may obtain a copy
//  of the License at  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
//  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
//  License for the specific language governing permissions and limitations under
//  the License.
//

#import "ER3DESEncrypt.h"

@implementation ER3DESEncrypt

- (id)init
{
    movedBytes  = 0;
    bufferPtr   = NULL;
    _encryptKey = (_encryptKey == nil)? [self get24BitKey:@"abcd12345678901234567890"]: [self get24BitKey:_encryptKey];
    return [super init];
}

- (id)initWithKey:(NSString *)keyString
{
    _encryptKey = keyString;
    return [self init];
}

- (NSString *)encryptString:(NSString *)originalString
{
    NSData *originalStringData = [originalString dataUsingEncoding:NSUTF8StringEncoding];
    size_t bufferPtrSize = ([originalStringData length] + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    CCCryptorStatus ccStatus = CCCrypt(kCCEncrypt,
                                       kCCAlgorithm3DES,
                                       kCCOptionPKCS7Padding | kCCOptionECBMode,
                                       [_encryptKey UTF8String],
                                       kCCKeySize3DES,
                                       nil,
                                       (const void *)[originalStringData bytes],
                                       [originalStringData length],
                                       (void *)bufferPtr,
                                       bufferPtrSize,
                                       &movedBytes);
    if(ccStatus != 0){
        NSLog(@"encrypt error, plz check key and string.");
        return @"";
    }
    NSString *string = [GTMBase64 stringByEncodingData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes]];
    free(bufferPtr);
    return string;
}

- (NSString *)decryptString:(NSString *)encryptedString
{
    NSData *encryptedStringData = [GTMBase64 decodeData:[encryptedString dataUsingEncoding:NSUTF8StringEncoding]];
    size_t stringBufferSize = [encryptedStringData length];
    size_t bufferPtrSize = (stringBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    
    CCCryptorStatus ccStatus = CCCrypt(kCCDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding | kCCOptionECBMode,
                       [_encryptKey UTF8String],
                       kCCKeySize3DES,
                       nil,
                       [encryptedStringData bytes],
                       stringBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    if(ccStatus != 0){
        NSLog(@"decrypt error, plz check key and string.");
        return @"";
    }
    
    NSString *string = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes]
                                             encoding:NSUTF8StringEncoding];
    free(bufferPtr);
    return string;
}

#pragma mark -- private methods

- (NSString *)get24BitKey:(NSString *)keyString
{
    if (keyString.length == 24) return keyString;
    
    if (keyString.length > 24){
        keyString = [keyString substringWithRange:(NSRange){0,24}];
    }
    else{
        keyString = [keyString stringByAppendingFormat:[NSString stringWithFormat:@"%%0%dd", 24 - keyString.length], 0];
    }
    return keyString;
}


@end
