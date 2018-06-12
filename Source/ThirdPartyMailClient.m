//
//  ThirdPartyMailClient.m
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

#import "ThirdPartyMailClient.h"

@implementation ThirdPartyMailClient

- (id)initWithDictionary : (NSDictionary *) dictionary {
    if (self = [super init]) {
        _name = [dictionary objectForKey:@"Name"];
        _URLScheme = [dictionary objectForKey:@"URLScheme"];
        _URLRoot = [dictionary objectForKey:@"URLRoot"];
        _URLRecipientKey = [dictionary objectForKey:@"URLRecipientKey"];
        _URLSubjectKey = [dictionary objectForKey:@"URLSubjectKey"];
        _URLBodyKey = [dictionary objectForKey:@"URLBodyKey"];
    }
    return self;
}

- (NSURL *) composeURL : (NSString *) recipient
               subject : (NSString *) subject
                  body : (NSString *) body {
    NSURLComponents *components;
    if (_URLRecipientKey == Nil) {
        components = [[NSURLComponents alloc] initWithString:[NSString stringWithFormat:@"%@:%@%@",_URLScheme,_URLRoot == Nil ? @"" : [NSString stringWithFormat:@"%@%@",_URLRoot, recipient ? @"/":@""], recipient]];
    } else {
        components = [[NSURLComponents alloc] initWithString:[NSString stringWithFormat:@"%@:%@",_URLScheme,_URLRoot == Nil ? @"" : _URLRoot]];
    }
    [components setScheme:_URLScheme];
    
    NSMutableArray *queryItems = [NSMutableArray new];
    if (_URLRecipientKey && recipient) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:_URLRecipientKey
                                                          value:recipient]];
    }
    if (_URLSubjectKey && subject) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:_URLSubjectKey
                                                          value:subject]];
    }
    if (_URLBodyKey && body) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:_URLBodyKey
                                                          value:body]];
    }
    if ([queryItems count] != 0) {
        components.queryItems = queryItems;
    }
    return components.URL;
}

@end
