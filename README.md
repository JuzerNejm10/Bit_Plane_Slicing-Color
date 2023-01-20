# Bit_Plane_Slicing-Color


Recently I've stumbled upon some images obtained by bit plane slicing and decided to implement the method in Processing. I have a couple of variants including one which uses Gray code instead of the standard binary one. The version hosted on GH is another one - it does not reduce the 8-bit image to binary representations but rather uses the pixel brightness of all 3 RGB channels separately and reduces only this separate channels. In this way we can construct the color of pixels from combined channels' values so we no longer have just 2 but we can have 2 to the 3rd power number of colors: black, white, red, green, blue, yellow, fuchsia & cyan. It can make the images octal (kinda) and fun (hopefully)...

Image selection is done via file dialog and you can cancel the currently processed file by hitting backspace (not the most responsive action though). 
Original image is first copied to data folder of the project and then one by one the planes (8 of them) are computed, showed on the screen and saved to data folder.   
Escape the app with ESC or alternatively ALT+F4 (Command-Q on Mac).

Images are made to fit screen with the adapt function (took some effort to come up with that one :/)
