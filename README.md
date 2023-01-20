# Bit_Plane_Slicing-Color

https://en.wikipedia.org/wiki/Bit_plane


Recently I've stumbled upon some images obtained by bit plane slicing and decided to implement the method in Processing. I have a couple of variants including one which uses Gray code instead of the standard binary one. The version hosted on GH is another one - it does not reduce the 8-bit image to binary representations but rather uses the pixel brightness of all 3 RGB channels separately and reduces only this separate channels. In this way we can construct the color of pixels from combined channels' values so we no longer have just 2 but we can have 2 to the 3rd power number of colors: black, white, red, green, blue, yellow, fuchsia & cyan. It can make the images octal (kinda) and fun (hopefully)...

Image selection is done via file dialog and you can cancel the currently processed file by hitting backspace (not the most responsive action though). 
Original image is first copied to data folder of the project and then one by one the planes (8 of them) are computed, showed on the screen and saved to data folder.   
Escape the app with ESC or alternatively ALT+F4 (Command-Q on Mac).

Images are made to fit screen with the adapt function (took some effort to come up with that one :/)


Example of BPS-Color in action (the original img followed by planes 1-8):

![original](https://user-images.githubusercontent.com/107032742/213793254-ed90719d-ea8f-4c1f-bafe-b315705b9538.jpg)

![plane1](https://user-images.githubusercontent.com/107032742/213793418-f8853b87-2088-4ad8-8fdb-86fbc305a186.jpg)![plane2](https://user-images.githubusercontent.com/107032742/213793846-e9121613-deac-42f2-a969-53969c7733f1.jpg)![plane3](https://user-images.githubusercontent.com/107032742/213794053-bcaec5b2-4db1-448c-8102-2348f644f7a4.jpg)![plane4](https://user-images.githubusercontent.com/107032742/213794151-28f3099f-a545-4746-940d-a78a8a359f06.jpg)![plane5](https://user-images.githubusercontent.com/107032742/213794285-3f5237e1-e27f-46cb-ab50-417f217042fa.jpg)![plane6](https://user-images.githubusercontent.com/107032742/213794399-c3cb5b3f-7d2a-4bcb-85b4-06abe69d063b.jpg)![plane7](https://user-images.githubusercontent.com/107032742/213794491-df0f00a1-5273-421f-ab9c-f87c5bef1049.jpg)![plane8](https://user-images.githubusercontent.com/107032742/213794593-7fa0a60e-5775-4208-8020-fbff9cde4a5e.jpg)



BTW you can download Desktop Windows App under Releases,
here's a shortcut:

https://github.com/JuzerNejm10/Bit_Plane_Slicing-Color/releases/tag/v.01




  





