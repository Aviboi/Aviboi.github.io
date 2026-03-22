---
layout: default
title: ENGRD 2020 Nutcracker Design
---

# ENGRD 2020 Nutcracker Design Project

## **Problem statement:** 
As part of my introductory statics course at Cornell, ENGRD 2020, I was tasked with designing a handheld nutcracker to be used to crack macadamia nuts.

### **Given constraints and parameters:**
The nutcracker must be able to provide enough force to crack most macadamia nuts, without requiring too large of a grip strength (greater than average). When operated, the handles of the nutcracker should be able to fit comfortably within the average palm (not too small or large), and the overall length of the nutcracker should fit within a practical handheld range.

### **My approach to the problem:**
My first step was to gather data on the constraints, such as the force required to crack a macadamia nut, and the average human grip strength. 

I found [this](https://doi.org/10.1016/S0894-1130(99)80046-5) paper, which states that the average grip strength is 90.1 lbf. For the macadamia nut strength, I used the value in [this](https://doi.org/10.1007/s10071-007-0131-2) paper, of around 222.18 kg, or 489.6 lbf. I couldn't find a good source for average palm size, so I estimated it at around 2-4 inches.

Based off of this, I calculated that the nutcracker should have a mechanical advantage of at least 5.434.
<br>
$$MA = \frac{F_{out}}{F_{in}} = \frac{489.6 lbf}{90.1 lbf} = 5.434$$
<br>
Meaning, the handles should be at least 5.434 time as far from the hinge as the nut. We would prefer that the nut be placed closer to the hinge, as this will reduce the handle length needed to provide the required mechanical advantage. Based on the dimensions of a macadamia nut (d ~ 0.75 in), it's point of contact with the teeth is at least ~1 inch from the hinge, requiring a total length of at least 5.434 inches.
<br>
$$\Sigma M = 0 = dF_{out} - DF_{in}$$<br>
$$D = \frac{dF_{out}}{F_{in}} = \frac{(1.0 in)(489.6 lbf)}{(90.1 lbf)} = 5.434 in$$
<br>
We also want to make sure that the grip size is within 2-4 inches to maintain comfortable operation. 
Using similar triangles, we find that the maximum separation between the handles for our current design is 4.06 inches, which is within our set range.
<br>
$$\frac{h}{d} = \frac{H}{D}$$<br>
$$H = \frac{hD}{d} = \frac{(0.375 in)(5.434 in)}{(1.0 in)} = 2.03 in$$
<br>
Using the Pythagorean theorem to solve for the handle size given these dimensions, we find that the handles must be at least 5.86 inches. 
<br>
$$L = \sqrt{H^2 + D^2} = \sqrt{(2.03 in)^2 + (5.434 in)^2} = 5.86 in$$
<br>
For the final design, we can bump the handle length up to 6.00 inches, with the teeth 1 inch from the hinge, which should add some wiggle room for the mechanical advantage.

<img src="/images/diagram.png" width="300">

### **Discussion of usability:**
The final note is that for usability, our device should include a flair with teeth to prevent the nut from sliding out of the device under load, enabling sufficient force to be applied.

Many of the constraints relating to grip strength and hand size ensure that our device is as usable as possible, even if it reduces the mechanical advantage of our mechanism. While we do value force amplification, we also value other traits such as compactness and one-handed operation, which may be impacted. So, we should consider all of these aspects when creating our design.

[Back to Projects](/projects.md)
