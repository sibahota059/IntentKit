//
// Created by Arvid on 17/12/13.
// Copyright (c) 2013 Mike Walker. All rights reserved.
//

#import "INKMailHandler.h"
#import "INKActivityPresenter.h"


@implementation INKMailHandler

- (INKActivityPresenter *)sendMailTo:(NSString *)recipient {
    NSString *command = NSStringFromSelector(_cmd);
    NSDictionary *args = [self argsDictionaryWithDictionary:@{ @"recipient" : recipient }];

    return [self performCommand:command withArguments:args];
}

#pragma mark - Private methods
- (NSDictionary *)argsDictionaryWithDictionary:(NSDictionary *)args {
    NSMutableDictionary *newArgs = [args mutableCopy];
    if (self.subject) {
        newArgs[@"subject"] = urlEncode(self.subject);
    }

    if (self.messageBody) {
        newArgs[@"messageBody"] = urlEncode(self.messageBody);
    }

    return [newArgs copy];
}
@end