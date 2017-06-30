# Computer Vision - Equation Detector
An optical number recognition system that detects printed equations in images and solves them.
A personal project by Riley Waters (completed 2017/06/22).

![Alt text](/sample1.png?raw=true "Sample output of a simple handwritten equation")

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

**System Adjustments**

The system was tested to see if it could handle handwriting. The idea was to train the system on an image of certain handwriting, then test it on another. The results of this were not satisfactory, with about 30~50% correct detection rate of characters. The neatness of the handwriting made large changes to the Hu values, so only a few characters had consistent detection rate. The system scope was lowered to only involve printed text calculations. 

The Hu moments were found to be very small and did not have much difference between different characters. It was noticed that in the related work, the authors took the log transformation of the Hu values, giving the moments larger differences. This was implemented into the system and accuracy rose about 20%. 
 
The ‘.’ And ‘-‘characters had a problem where the character would take up the entirety of the region box, resulting in an NaN third Hu value and incorrect character prediction. An adjustment was made to check if the solidity of a region was >=0.94 during feature extraction. If so, that region received a marker number of 1, indicating that it was known to be ‘.’ or ‘-‘. The comparison loop then finds that marker and compares the region to those characters separately by just their first Hu number. This resulted in a 100% detection of ‘.’ and ‘-‘characters during testing. 
 
In a similar manner, ‘/’ has a unique eccentricity that is consistently >=0.99 due to its line shape. A check for this eccentricity was made during feature extraction, and regions with this feature were given a marker of 2. If the comparison loop finds this number, the character is matched to ‘/’ and it does not need to compare to any other characters. This resulted in a 100% detection of ‘/’ in testing. 

An attempt was made to use Euler numbers to further separate characters. In theory, ‘8’ will have a unique Euler number of -1, and ‘4’, ‘6’, ‘9’, and ‘0’ will have 0. The idea was to use Euler numbers to separate these characters beforehand. However, testing regions sometimes had incorrect Euler numbers due to noise producing small holes in the objects. It was decided that this adjustment was too dependant on having perfect preprocessing, so it was not used. 
 
Differentiating the ‘6’ and ‘9’ was an expected problem when using this method. Both had very close Hu moment values due to the rotation invariance of the moments. Deshpande’s suggested method was implemented to solve this. Whenever a ‘6’ or ‘9’ is detected, the region image is sent to a different function that splits the image into top and bottom half. The areas of each half are compared and the character is detected as a ‘9’ if the top area is larger than the bottom, otherwise it is a ‘6’. This resulted in a 100% detection of ‘6’ and ‘9’ in testing.
