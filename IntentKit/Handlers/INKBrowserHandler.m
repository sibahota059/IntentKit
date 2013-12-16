//
//  INKBrowserHandler.m
//  IntentKit
//
//  Created by Michael Walker on 11/26/13.
//  Copyright (c) 2013 Mike Walker. All rights reserved.
//

#import "INKBrowserHandler.h"
#import "INKActivity.h"

@implementation INKBrowserHandler

- (INKActivityPresenter *)openURL:(NSURL *)url {
    NSString *strippedUrl = [url.resourceSpecifier stringByReplacingOccurrencesOfString:@"//" withString:@"" options:0 range:NSMakeRange(0, 2)];
    NSDictionary *args = @{@"url": strippedUrl};

    NSString *command = ([url.scheme isEqualToString:@"https"] ?
                         @"openHttpsURL:" : @"openHttpURL:");

    return [self performCommand:command withArguments:args];
}

- (INKActivityPresenter *)openURL:(NSURL *)url withCallback:(NSURL *)callback {
    NSString *command = NSStringFromSelector(_cmd);

    NSString *appName = [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    NSString *targetURL = urlEncode(url.absoluteString);
    NSString *callbackURL = urlEncode(callback.absoluteString);
    NSDictionary *args = @{@"url": targetURL,
                           @"callback": callbackURL,
                           @"source": appName};

    return [self performCommand:command withArguments:args];
}
@end