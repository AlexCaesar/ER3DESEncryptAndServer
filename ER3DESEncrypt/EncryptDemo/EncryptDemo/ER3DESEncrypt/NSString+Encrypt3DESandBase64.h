//
//  NSString+Encrypt3DESandBase64.h
//
//  Created by Er.Z on 13-12-2.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@interface NSString (Encrypt3DESandBase64)
- (NSString *)encryptStringWithKey:(NSString*)_encryptKey;
- (NSString *)decryptStringWithKey:(NSString*)_encryptKey;
@end
