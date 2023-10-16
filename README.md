# mdt-demo-SwiftUI-Kit
Library of Swift UI Components for BBC Mobile Development Team.

## 📑 Table of content
* [BannerView](#bannerview-component)
* [NotificationView](#notificationview-component)
* [CornerButton](#cornerbutton-component)

## BannerView Component
### Description
My solution for banner view in SwiftUI is a View Modifier. Which means that it can only be used with another view. But the control over it can be delegated to the view model (or somewhere else) when necessary. 

### How it works
To get a banner view working inside you app you’ll need 2 things:
1. A Swift UI view to connect it to:
```
List {
  ...
} 
.banner(data: $data, showBanner: $isShowing)
```
2. And two binding variables - one that triggers the appearance (and in case of loading - disappearance) of the banner and one with the information you want displayed:
```
@State var isShowing: Bool = false
@State var data: BannerData = BannerData.defaultData()
```


### Additional note
Here is an example of functions you can use to show / dismiss loading view. No additional set up needed.
```
func showLoadingBanner() {
        DispatchQueue.main.async {
            self.bannerData = BannerData(detail: "Loading...", type: .loading)
            self.showBanner = true
        }
    }
    
    func dismissLoadingBanner() {
        DispatchQueue.main.async {
            withAnimation {
                self.showBanner = false
            }
        }
    }
```

### How banners look

<img width="450" alt="SuccsessBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/bafe9b45-9097-4a7b-b52b-fb14925c8340">
<img width="450" alt="InfoBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/2910b9be-87a4-4a91-a247-a183993beebc">


<img width="450" alt="ErrorBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/45b5cde7-17d1-4d5e-af03-bc1b7ed2dd58">
<img width="450" alt="WarningBanner" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/e9d5e822-b76a-4051-b4f3-674fb143a504">

<details>
    <summary> ✨ Bonus gif </summary>
	
 ![LoadingBanner](https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/9ea23eba-fdcf-4d6a-9aad-f4996bb97b06)

</details>

If you like to see more options - download the project and check previews for the BannerView.


## NotificationView Component
### Description
This view started as a way to show user an error without making it an alert. It evolved into a rater subtile notification view - which does not require user to react to it immediately in any way, but allows them to share the bug report in a few clicks.

### How it works
To get a notification view simply call it with default initialiser:
```
NotificationView(type: .info,
                 title: "Update in 2 hours",
                 message: "Please note that the app will be unavailable for 30 minutes later today for maintainance work 🛠️",
                 standalone: true)
```

**For the error and warning notifications** make sure to display localised description of an error in message field - it usually is more readable plus it will be exactly the thing user will have an option to report as a bug description. 

Additionally, it’s possible to disable report a bug feature inside the sharing options - for example, in rare case of the bug is happening inside the feedback pod itself. To do so pass a negative value to the `isFeedbackAvailible` variable inside NotificationViewModel. 

### How notifications look
<img width="450" alt="notificationTypesList" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/5b2fed1a-74e6-4f50-9774-ac2f30e8f54a">
<img width="450" alt="shareOptions" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/ca9f2fc1-a7ce-418c-b00e-90849bd4a9ec">  
<img width="450" alt="notificationDarkMode" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/b52aeb4b-4097-404e-af9b-3774ee229982">
<img width="450" alt="dynamicNotificationFont" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/ec0b2c5b-3e70-4355-ac3f-c9c66c394bbe">

If you like to see more options - download the project and check NotificationPreview.

## CornerButton Component
### Description
It is essentially a view modifier that allows to add a corner button to any view. Right now corner button has two modes - edit and delete buttons. The icons, background and alignment of the button changes depending on the mode. 
<br> It is possible to add more modes in the future, if needed.

### How it works
It is a very straight forward. Just add this view modifier to the view:
```
.overlayCornerButton(role: .delete) {
           //your function
 }
```

**Notes**: 
<br> - do not use padding on the view before applying this overlay - it will mess the alignment. Add all the paddings after the overlay;
<br> - this component works best if the parent view has corner radius at least 10.

### How corner buttons look
Light & dark versions:
<br> <img width="150" alt="CornerButtonsLight" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/1261699e-685c-45ea-a2bc-804ed08690be">
<img width="150" alt="CornerButtonsDark" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/571572cd-fdae-40a3-b27d-d4a555d3d637">
<br> Buttons in use:
<br> <img width="450" alt="CornerButtonsInFeedbackPod" src="https://github.com/bbc/mdt-ios-SwiftUIKit/assets/45575272/cb17f01f-9fb1-4ea7-be24-557c1b8319a0">
