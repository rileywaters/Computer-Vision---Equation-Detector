# Computer Vision - Equation Detector
An optical number recognition system that detects printed equations in images and solves them.
A personal project by Riley Waters (completed 2017/06/22).

**Abstract**  

The goal of this project was to create a system that can interpret and solve a basic mathematical equation from a picture of printed numbers and operators. The system does this by extracting features from a training image with known characters, then extracting those same features from a testing image and finding which training character each test character is closest to. Several improvements were made, and the final system has reasonable accuracy (~80%) while maintaining greater efficiency than other machine learning solutions.
    
**Introduction and Background Description** 

Optical number recognition is the automatic recognition of numbers by computers in images or digitized text. It has many uses in automated guided vehicles, digital library scanning, and packaging industries. It is challenging to create a consistent number recognition system because of differences in writing styles/ fonts, positions of the text, image quality, and noise. 

Number recognition is often done by extracting features of characters that, together, are unique to that character. Some of the features that can be used for this are the Hu moments of an image. These are seven moments that are invariant to translation, scale, and rotation. They are found by performing different calculations on different normalized central moments of the image.

Some other region features that were used in this project are the eccentricity of an image (how circular the object is), the solidity (the proportion of the pixels in the convex hull to the region), and Euler numbers (the number of objects in an image minus the number of holes). 

**Problem Statement**

Many jobs involve interpreting numbers and equations from printed text. Doing this manually is tedious and has a high chance of error. A system is needed that can take in an image of text and interpret numbers and operators from it automatically, solving any valid equations it detects. The system needs to be invariant to scale, rotation, or translation of numbers in the image. 
 
**Related Work**

Deshpande (2012) used Hu moments in a number recognition system. His algorithm involved preprocessing a training and testing image, extracting Hu moments from those images, and finding a minimum distance value between each number in the testing image and training image. He concluded that the first three Hu moments could be used to accurately identify numbers (the others were too small) above 32x32 resolution. Most of this project is based on the algorithm he describes in his paper. Deshpande also proposed a solution to identify between ‘6’ and ‘9’ that is used in this project.  Zekovich and Tuba (2013) proposed an algorithm for detecting handwritten digits using Hu moments. This algorithm uses similar moment extraction of characters, followed by putting the moments into separate Support Vector Machines that classify the characters from those moments. Information from this paper was used to investigate handwritten number recognition possibilities of the project.  Lacrama and Snep (2006) implemented a neural network that was trained using data from invariant moments of characters. The network was used to test handwritten character recognition. This paper clarified other methods of character recognition as well as their strengths and weaknesses.  
 
  
**Proposed Solution**

The solution that was implemented was like the algorithm that Deshpande described in his paper. However, several changes were made to improve the accuracy in testing scenarios. Preprocessing was done on the training and testing images to isolate the characters. In the training image, the image was inverted so that the regions of each number could be found. The testing image was binarized using thresholding, then opened and closed with a line structuring element to remove unwanted background elements. It was also inverted for region labelling purposes
 