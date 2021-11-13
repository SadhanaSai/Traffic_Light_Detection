# Traffic_Light_Detection


## 1.	Introduction
This project aims to create a system that detects traffic signal lights from dashboard camera video streams. This would be of great use to drivers with poor color vision and in conditions where vision is compromised. Reliable traffic light detection can drastically impact transportation in case of connected and partly autonomous vehicles and when vision impaired drivers drive vehicles. 

The dashboard camera (henceforth referred to as dashcam) videos will be separated into multiple frame by frame images and processed to identify the color of traffic lights. Dashcam videos available in YouTube have been used for this purpose.

The variations in environmental conditions such as Rain, fog etc. would pose a challenge in detecting the traffic light and recognising the color. Image noise will also be taken into consideration during image processing and analysis. A large training dataset at different time periods in different locations and with different weather conditions can help ensure that errors are minimised. 

## 2.	Background 
The Ground Truth Labelling App was used to label Traffic lights in the input training video. The Labels were then used to create and train an ACF Object detectors for each of the traffic light color labels. Further these trained detectors where used to predict the labels for the objects in the Test video. The Test video was then annotated with the labels created using the detectors. The video is presented with the labels in a deployable Video Player.
The use of the ground Truth Labelling App to label objects was studied and implemented. The process of creating an ACF detector and using it to label objects in video data was studied.

## 3.	Implementation
<p align="center">
<img src = "https://github.com/SadhanaSai/Traffic_Light_Detection/blob/main/images/fig1.jpg" alt = "Fig 1: Process Flowchart"> 
</p>

## 4.	Results
The figure below (Fig 2) illustrates the result produced by the system. A bounding box showing the label was created when the Traffic light of the respective color was detected.
 
<p align="center">
<img src = "https://github.com/SadhanaSai/Traffic_Light_Detection/blob/main/images/fig2.png" alt = "Fig 2: Representation of the results"> 
</p>

## 5.	Conclusion
The system recognizes the color of the traffic lights and displays the label on the videos. The process of recognition and labeling depends highly on the computer’s speed and processing capabilities. The accuracy of color prediction in this system is not very high.

Through the process of creating this system, I have learned how to label videos, train the object detectors, and use these detectors to create labels in test input videos using MATLAB. This helped me gain insights on how the pre-existing algorithms in MATLAB work, and the pros and cons of using them to train models for object detection.
 
## 6.	Scope for improvement
•	Use of webcam to write the input video to the detector needs to be made more efficient in order to make this system viable for use in real life.

•	A more diverse training set with varied environmental conditions needs to be used to make the system robust.

•	An algorithm to detect the Traffic light objects with a greater accuracy needs to be written instead of using in-built algorithms.

## References
1.	https://www.cs.rit.edu/usr/local/pub/GraduateProjects/2161/sxb4298/Report.pdf, accessed on 2nd November, 2019.
2.	https://pdfs.semanticscholar.org/1260/b045dd613a7772488b665063402134b2b380.pdf?_ga=2.75547285.1421760262.1572836054-939018244.1572836054, accessed on 2nd November, 2019.
3.	https://www.mathworks.com/help/driving/ug/get-started-with-the-ground-truth-labeler.html, accessed on 14th December, 2019
