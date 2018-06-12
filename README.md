# ThirdPartyMailer (Objective C version)

_Interact with third-party iOS mail clients, using custom URL schemes._

![Platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
[![MIT license](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/vtourraine/ThirdPartyMailer/raw/master/LICENSE.md)


## Supported mail clients

Client             | URL Scheme      | App Store
------------------ | --------------- | ---------
Gmail              | `googlegmail`   | [link](https://itunes.apple.com/app/id422689480?mt=8)
Dispatch           | `x-dispatch`    | [link](https://itunes.apple.com/app/id642022747?mt=8)
Spark              | `readdle-spark` | [link](https://itunes.apple.com/app/id997102246?mt=8)
Airmail            | `airmail`       | [link](https://itunes.apple.com/app/id993160329?mt=8)
Microsoft Outlook  | `ms-outlook`    | [link](https://itunes.apple.com/app/id951937596?mt=8)
Yahoo Mail         | `ymail`         | [link](https://itunes.apple.com/app/id577586159?mt=8)

Unfortunately, not all mail clients offer URL schemes to be supported by `ThirdPartyMailer`. If you’re aware of another candidate, please [let us know](https://github.com/vtourraine/ThirdPartyMailer/issues https://github.com/seoras/ThirdPartyMailer/issues).


## How to install

Manually import the files from the Source folder.
Pod support maybe added later.

## How to use

Getting the list of available clients:

``` Obj C
NSArray *otherMailApps = [ThirdPartyMailer availableClients];
```

Opening the client (with optional message recipient, subject, and body):

``` Obj C
[ThirdPartyMailer openMailClient:client
                       recipient:@"you@foobar.com"
                         subject:@"FooBar"
                            body:@"Dear Foobar, ..." 
                      completion:^(BOOL success){
                                    NSLog(@"Email sent using %@",client.name);
                                }];
```


## Requirements

ThirdPartyMailer (ObjC) is written in Objective C, requires iOS 8.0 and above, Xcode 8.0 and above.


## Credits

ThirdPartyMailer (Swift) was created by [Vincent Tourraine](http://www.vtourraine.net).
ThirdPartyMailer port to Objective C was created by [George Taylor] (https://georgetaylor.com).


## License

ThirdPartyMailer is available under the MIT license. See the LICENSE file for more info.