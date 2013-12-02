ER3DESEncryptAndServer
======================

NSString encrypt/decrypt tools  and server(php) decrypt/encrypt.

##useage

 * ###use ER3DESEncrypt

	
```Objective-C
		#import "ER3DESEncrypt.h"
		...
		NSString *orig = @"www.erblah.com", *encryptString, *decryptString, *key = @"I love you.";

    	//default key: abcd12345678901234567890
    	ER3DESEncrypt *encryptDefaultKey = [[ER3DESEncrypt alloc] init];
    
    	orig = @"www.erblah.com";
    	encryptString = [encryptDefaultKey encryptString:orig];
    	decryptString = [encryptDefaultKey decryptString:encryptString];
    	NSLog(@"key:%@\n%@ --- %@ --- %@",encryptDefaultKey.encryptKey, 
    							orig, encryptString, decryptString);
    
    
    	//custom key
    	ER3DESEncrypt *encryptCustomKey = [[ER3DESEncrypt alloc] initWithKey:key];
    
    	encryptString = [encryptCustomKey encryptString:orig];
    	decryptString = [encryptCustomKey decryptString:encryptString];
    	NSLog(@"key:%@\n%@ --- %@ --- %@",encryptDefaultKey.encryptKey, 
    							orig, encryptString, decryptString);
```


 * ###use Category(NSString+Encrypt3DESandBase64)
 
 
```Objective-C
		#import "NSString+Encrypt3DESandBase64.h"
		...
		NSString *orig = @"www.erblah.com", *encryptString, *decryptString, *key = @"I love you.";
		encryptString = [orig encryptStringWithKey:key];
    	decryptString = [encryptString decryptStringWithKey:key];
   		NSLog(@"key:%@\n%@ --- %@ --- %@", key, orig, encryptString, decryptString);
   		
```
   		
   		
   		
 * ###Server (php)
 
 	^_^ , Plz open **Crypt3Dephp** file.