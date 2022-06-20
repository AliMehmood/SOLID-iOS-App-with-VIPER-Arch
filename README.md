# SOLID iOS App on VIPER Architecture


This application is a sample iOS app, which will be fully written on VIPER architecture along with Swift Packages. It will be following SOLID principles by Uncle Bob, thus following a clean architecture.



## Basic Overview
- Minimum iOS version is 13.0

## Swift Packages
- Project is build on VIPER pattern with fully observing SOLID principles
- Project contains Swift packages for Lottie using SDWebImageCoder


## To view loading skeleton effect (shimmer lottie) on tableview upon loading data from API:
- Comment Line 31 in TrendingViewController class to forcefully invoke loading skeleton effect on tableview

![Simulator Screen Shot - iPhone 12 Pro Max - 2022-06-20 at 14 10 42](https://user-images.githubusercontent.com/12109389/174568239-861c4dab-8510-4372-a4ab-a5930ec76582.png)


## To view Retry and user busy Lottie effect
- Un-comment Line 26 & 27 in TrendingInteractor class to forcefully invoke  user busy Lottie effect

![image](https://user-images.githubusercontent.com/12109389/174578379-71f6f622-3caf-4674-9304-159e33af391d.png)


## Unit Tests
- Unit Test were made only Router's 1 function to demo purpose.


