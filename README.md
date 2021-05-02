# ThirdPartyMailer (Objective C version)

_Interact with third-party iOS mail clients, using custom URL schemes._

For the Swift version [follow this link](https://github.com/vtourraine/ThirdPartyMailer/).

![Platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
[![MIT license](http://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/Seoras/ThirdPartyMailer/blob/master/LICENSE)


## Supported mail clients

Client             | URL Scheme      | App Store
------------------ | --------------- | ---------
Gmail              | `googlegmail`   | [link](https://apps.apple.com/app/id422689480?mt=8)
Dispatch           | `x-dispatch`    | [link](https://apps.apple.com/app/id642022747?mt=8)
Spark              | `readdle-spark` | [link](https://apps.apple.com/app/id997102246?mt=8)
Airmail            | `airmail`       | [link](https://apps.apple.com/app/id993160329?mt=8)
Microsoft Outlook  | `ms-outlook`    | [link](https://apps.apple.com/app/id951937596?mt=8)
Yahoo Mail         | `ymail`         | [link](https://apps.apple.com/app/id577586159?mt=8)
Fastmail           | `fastmail`      | [link](https://apps.apple.com/app/id931370077?mt=8)

Unfortunately, not all mail clients offer URL schemes to be supported by `ThirdPartyMailer`. If you’re aware of another candidate, please let us know [Swift](https://github.com/vtourraine/ThirdPartyMailer/issues) [ObjC](https://github.com/seoras/ThirdPartyMailer/issues).


## How to install

Manually import the files from the Source folder. Pod support maybe added later.

Open your App's info.plist file and add the key "LSApplicationQueriesSchemes", or update it, with the all the schemes found in [ThirdPartyMailer.plist](https://github.com/Seoras/ThirdPartyMailer/blob/master/Source/ThirdPartyMailer.plist). e.g.

```
<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>googlegmail</string>
		<string>readdle-spark</string>
		<string>x-dispatch</string>
		<string>airmail</string>
		<string>ms-outlook</string>
		<string>ymail</string>
	</array>
```

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

ThirdPartyMailer port to Objective C was created by [George Taylor](https://www.linkedin.com/in/georgemacraetaylor/).


## License

ThirdPartyMailer is available under the MIT license. See the LICENSE file for more info.
