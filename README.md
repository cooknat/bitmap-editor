# Bitmap editor

This bitmap simulator supports the following commands:

- I N M - Create a new N x M image with all pixels coloured white (O).
- C - Clears the table, setting all pixels to white (O).
- L X Y C - Colours the pixel (X,Y) with colour C.
- V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- S - Shows the contents of the current image


# Assumptions
1. Later commands will always override earlier commands.
2. A badly formed command should be skipped rather than stopping the program running,
   unless the command is fundamental, ie the initial creation of the bitmap.
3. Blank lines in the command file should be ignored.   

# Running
`>bin/bitmap_editor examples/show.txt`
