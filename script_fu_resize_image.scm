(define (script-fu-resize-image inFilename inWidth)
    (let*
        (
            ; define our local variables
            (theImageWidth 0)
            (theImageHeight 0)
            (theNewImageWidth inWidth)
            (theNewImageHeight 0)
            (theImage)  ; to hold the image that will beloaded from a file
            (theLayer)
            (theNewFilename inFilename) ; the output file same as input, so file is overwritten!!
            
        ) ; end of the local variables
        
        (set! theImage (car (gimp-file-load RUN-NONINTERACTIVE inFilename inFilename)))
        (set! theImageWidth (car (gimp-image-width theImage)))
        (set! theImageHeight (car (gimp-image-height theImage)))
        (set! theNewImageHeight (* (/ theNewImageWidth theImageWidth) theImageHeight))
        (set! theLayer (car (gimp-image-get-active-layer theImage)))
        (gimp-image-scale theImage theNewImageWidth theNewImageHeight)
        (gimp-layer-scale theLayer theNewImageWidth theNewImageHeight FALSE)
        (gimp-file-save RUN-NONINTERACTIVE theImage theLayer theNewFilename theNewFilename)
        
        (list theImage)
    )
)

(script-fu-register
    "script-fu-resize-image"                            ;function name
    "Resize Image"                                      ;menu label
    "Resizes an Image according to the user's\
     choice of new width. The height is 
     calculated proportionally."                  ;description
    "Robert Purvis"                                 ;author
    "Copyright 2021, Robert Purvis"                 ;copyright notice
    "7 June 2021"                                   ;date created
    ""                                      ;image type that the script works on
    SF-FILENAME     "Filename"      "example.jpg"
    SF-VALUE        "New width"     "1024"          ;a string variable
)
(script-fu-menu-register "script-fu-resize-image" "<Image>/Script-Fu/Image/Resize")

