# Computer Vision - Equation Detector
An optical number recognition system that detects printed equations in images and solves them.
A personal project by Riley Waters (completed 2017/06/22).

**Abstract**  

The goal of this project was to create a system that can interpret and solve a basic mathematical equation from a picture of printed numbers and operators. The system does this by extracting features from a training image with known characters, then extracting those same features from a testing image and finding which training character each test character is closest to. Several improvements were made, and the final system has reasonable accuracy (~80%) while maintaining greater efficiency than other machine learning solutions.
    
**Introduction and Background Description** 

Optical number recognition is the automatic recognition of numbers by computers in images or digitized text. It has many uses in automated guided vehicles, digital library scanning, and packaging industries. It is challenging to create a consistent number recognition system because of differences in writing styles/ fonts, positions of the text, image quality, and noise. 

Number recognition is often done by extracting features of characters that, together, are unique to that character. Some of the features that can be used for this are the Hu moments of an image. These are seven moments that are invariant to translation, scale, and rotation. They are found by performing different calculations on different normalized central moments of the image.

Some other region features that were used in this project are the eccentricity of an image (how circular the object is), the solidity (the proportion of the pixels in the convex hull to the region), and Euler numbers (the number of objects in an image minus the number of holes). 
 