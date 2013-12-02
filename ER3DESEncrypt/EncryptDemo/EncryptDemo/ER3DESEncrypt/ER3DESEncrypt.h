//
//  ER3DESEncrypt.h
//
//  Created by Er.Z on 13-12-2.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@interface ER3DESEncrypt : NSObject
{
    size_t movedBytes ;
    uint8_t *bufferPtr ;
}

@property (assign,nonatomic) NSString *encryptKey;

- (id)initWithKey:(NSString *)keyString;
- (NSString *)encryptString:(NSString *)originalString;
- (NSString *)decryptString:(NSString *)encryptedString;

@end
