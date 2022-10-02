OK, it's been around 3 hours and it's time to wrap this up!

### How to run:
 The project does not require any special setup, simply open the project file in XCode(I used version 14.0.1) and run the app in any simulator(Preferably iPhone/iPod because I didn't have time to adapt the views to iPad).


### Considerations:

I used VIPER as the architecture because it's what I use daily at my current position, it's great for separating business logic from view logic as requested in the test, but it did slow things down a bit because there's a lot of boilerplate to write.

I didn't want to use SwiftUI because my experience with it is very limited and I never implemented VIPER using SwiftUI. (I'm also not good enough with SwiftUI to make it work)

I didn't want to use Storyboards or XIBs because all the companies where I worked at had banned them in favor of writting views programmatically. (Fixing git conflicts on XML files with 20 thousand lines is a nightmare)

By creating the views programmatically I ended up losing some time, but the result in my opinion is much cleaner and easier to maintain.

I didn't want to use third party libraries because the project was very simple, and a single dependency would probably have more lines of code than the test itself. I did end up copying a extension from stack overflow to download the weather image because I had never implemented it myself (Had always used either Kingfisher or AlamofireImage)

I wanted to implement better error handling, but I ran out of time for the error view. I did implement a bunch of different error types and even passed the error back to the view, so all I'm missing is proper HTTP status code parsing and an Error View.

Since the test was supposed to be completed fast I  didn't bother with using git correctly, this folder is a repository but there's only a couple commits and they do not represent my progress meaningfully. 

Since I used the VIPER architecture all the classes are testable, unfortunately I did not have time to implement tests in the 3 hours I was given. 
I did end up making some tests as example in a separate branch, if you want to check it switch to the `unit-tests` branch.