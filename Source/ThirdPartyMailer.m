//
// ThirdPartyMailer.m
//
// Converted from ThirdPartyMailer.swift by Vincent Tourraine (http://www.vtourraine.net)
// to Object C by George Taylor (https://georgetaylor.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "ThirdPartyMailer.h"
#import <UIKit/UIKit.h>

@implementation ThirdPartyMailer

+ (NSArray *) clients {
  
	 NSBundle *bundle = [NSBundle bundleForClass:self.classForCoder];
	 NSURL *bundleURL = [[bundle resourceURL] URLByAppendingPathComponent:@"ThirdPartyMailer.bundle"];
	 NSBundle *resourceBundle = [NSBundle bundleWithURL:bundleURL];
    NSString *filePath = [resourceBundle pathForResource:@"ThirdPartyMailer" ofType:@"plist"];
    NSArray *clientsMaster = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *list = [[NSMutableArray alloc] initWithCapacity:[clientsMaster count]];
    for (NSDictionary *clientDictionary in clientsMaster) {
        ThirdPartyMailClient *client = [[ThirdPartyMailClient alloc] initWithDictionary:clientDictionary];
        if (client) {
            [list addObject:client];
        }
    }
    return list;
}

+ (NSArray *) availableClients {
    NSArray *clients = [ThirdPartyMailer clients];
    NSMutableArray *list  = [NSMutableArray new];
    for (ThirdPartyMailClient *client in clients) {
        if ([ThirdPartyMailer isMailClientAvailable:client]) {
            [list addObject:client];
        }
    }
    return ([list count] == 0) ? Nil : list;
}

+ (Boolean) isMailClientAvailable : (ThirdPartyMailClient *) client {
    NSURLComponents *components = [NSURLComponents new];
    [components setScheme:client.URLScheme];
    if (components.URL == Nil) {
        return NO;
    }
    return [[UIApplication sharedApplication] canOpenURL:components.URL];
}

+ (void) openMailClient : (ThirdPartyMailClient *) client
              recipient : (NSString *) recipient
                subject : (NSString *) subject
                   body : (NSString *) body
             completion : (void (^)(BOOL)) handler {
    NSURL *url = [client composeURL:recipient subject:subject body:body];
    if (url) {
        [[UIApplication sharedApplication] openURL:url
                                           options:@{}
                                 completionHandler:handler];
    } else {
        handler(NO);
    }
}

@end
