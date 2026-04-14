# Region Growing Tumor Segmentation in MATLAB

## Overview

This project implements an intensity-based region growing algorithm to segment tumors or regions of interest from grayscale medical images.

---

## Why I Built This

I developed this project to explore core concepts in:

* Medical image processing
* Image segmentation techniques
* Pixel connectivity and intensity-based region analysis

It also serves as a foundational step toward more advanced tumor detection systems used in real-world healthcare applications.

---

## Methodology

* The user selects a **seed point** on the image
* The algorithm examines neighboring pixels using an **8-connected neighborhood**
* Pixels with similar intensity values are grouped together
* The region expands iteratively until the condition is no longer satisfied

---

## Features

* Interactive seed point selection
* Manual implementation of region growing
* 8-connected neighborhood processing
* Binary mask generation of segmented region
* Overlay visualization on original image
* Saves both mask and highlighted output

---

## Applications

* Tumor segmentation in MRI scans (e.g., meningioma)
* Region of interest extraction
* Medical image analysis
* Preprocessing step for advanced AI-based diagnosis systems

---

## How to Run

1. Open MATLAB
2. Place the input grayscale image in the project folder
3. Run the main script:

   ```matlab
   main.m
   ```
4. Click on the image to select a seed point when prompted
5. The segmented region and outputs will be displayed and saved
