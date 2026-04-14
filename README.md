# Meningioma Tumor Segmentation using Region Growing in MATLAB

## Overview

This project implements an intensity-based region growing algorithm to segment **meningioma tumors** from grayscale MRI images.

The system processes a folder of medical images and applies semi-automatic segmentation by allowing the user to initialize the region using a seed point.

---

## Why I Built This

I developed this project to:

* Apply image segmentation techniques to a real-world medical dataset
* Understand how tumors can be extracted based on pixel intensity
* Bridge the gap between theoretical image processing and practical healthcare applications

This project serves as a foundational step toward more advanced automated tumor detection systems.

---

## Methodology

* A dataset folder containing meningioma MRI images is used as input
* For each image:

  * The user selects a **seed point** inside the tumor
  * The algorithm uses an **8-connected neighborhood**
  * Neighboring pixels with similar intensity are grouped
* The region expands until the similarity condition fails

---

## Features

* Batch processing of multiple images from a folder
* Interactive seed selection for each image
* Manual implementation of region growing
* Binary mask generation for tumor region
* Overlay of segmented tumor on original image
* Automatic saving of results

---

## Applications

* Meningioma tumor segmentation in MRI scans
* Medical image analysis and preprocessing
* Educational tool for understanding segmentation techniques
* Foundation for AI-based tumor detection systems

---

## Input

* Folder containing grayscale MRI images of meningioma tumors

---

## 📂 Output

For each input image:

* Binary mask of segmented tumor
* Overlay image highlighting the tumor region

---

## ▶️ How to Run

1. Open MATLAB
2. Place the dataset folder in the project directory
3. Update the folder path in the script (if required)
4. Run:

   ```matlab
   main.m
   ```
5. Click on the tumor region in each image to initialize segmentation
6. Results will be displayed and saved automatically
