# DVIA-v2
DVIA-v2 written in Swift along with additional vulnerabilities

Damn Vulnerable iOS App (DVIA) is an iOS application that is damn vulnerable. Its main goal is to provide a platform to mobile security enthusiasts/professionals or students to test their iOS penetration testing skills in a legal environment. This project is developed and maintained by @prateekg147. The vulnerabilities and solutions covered in this app are tested up to iOS 11. The current version is writen in Swift and has the following vulnerabilities.

1. Local Data Storage
2. Jailbreak Detection
3. Excessive Permissions
4. Runtime Manipulation
5. Anti Anti Hooking/Debugging
6. Binary Protection
7. Touch/Face ID Bypass
8. Phishing
9. Side Channel Data Leakage
10. IPC Issues
11. Broken Cryptography
12. Webview Issues
13. Network Layer Security
14. Application Patching
15. Sensitive Information in Memory

## Installing DVIA on any iOS device 

The best way to install DVIA is using <a href="www.cydiaimpactor.com/
">Cydia Impactor</a>

### Steps
1. Create an Apple ID https://appleid.apple.com/account
2. Download <em>Impactor</em>, make sure the device you want to install the app on is connected to your computer. Now drag and drop the <em>IPA</em> file to <em>Impactor</em>.
3. Enter your Apple ID credentials. App will install on the device
4. Go to your device, <em>Settings -> General -> Device Management</em>. Select the Apple ID you used to install the app. Click on <em>Verify App</em> under DVIAv2.

## Compiling DVIA using Xcode

### Steps

1. Clone the DVIA repo , git clone https://github.com/prateek147/DVIA-v2
2. cd to the project root directory where the <em>Podfile</em> is present (/DVIA-v2/DVIA-v2). Then run <em>pod install</em>
3. Open the <em>DVIA-v2.xcworkspace</em> file with Xcode. You can now directly run the app on a simulator.
4. For running on the device, go under Project settings in Xcode on the top left, head over to the <em>General</em> tab and under <em>Signing</em>, enter credentials for your Apple ID.
5. Now you can build and run the project on the device. You will have to trust the app again by going under Settings -> General -> Device Management. 

