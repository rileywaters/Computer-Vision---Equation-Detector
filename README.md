# Computer-Vision---Equation-Detector
An optical number recognition system that detects printed equations in images and solves them. 
A personal project by Riley Waters (completed 2017/06/22)

**Abstract**  
	The goal of this project was to create a system that can interpret and solve a basic mathematical equation from a picture of printed numbers and operators. The system does this by extracting features from a training image with known characters, then extracting those same features from a testing image and finding which training character each test character is closest to. Several improvements were made, and the final system has reasonable accuracy (~80%) while maintaining greater efficiency than other machine learning solutions.