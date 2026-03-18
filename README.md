# Machine Problem 2 – Numerical Solution of Differential Equations

## Overview
This project focuses on solving a given **differential equation** both **analytically** and **numerically** using MATLAB.

The program implements:
- **Euler’s Method**
- **Fourth-Order Runge-Kutta Method (RK4)**

It also compares the numerical solution with the **exact (analytical) solution** through tables and plots.

---

## Problem Description

You are tasked to solve an assigned differential equation in two parts:

### Task 1: Analytical Solution
Solve the differential equation manually by following these steps:

1. Express in the form:
   \[
   M(x,y)\,dx + N(x,y)\,dy = 0
   \]
2. Check if the equation is **exact**
3. If not exact, determine the **integrating factor**
4. Re-test for exactness
5. Solve using the assigned method for exact equations
6. Apply initial conditions to find constant \( C \)
7. Express the solution explicitly:
   \[
   y = f(x)
   \]

---

### Task 2: Numerical Solution (MATLAB)

Create a MATLAB script that computes the solution using:

- **Euler’s Method**
- **Runge-Kutta Method (4th Order)**

---

## Features

- User input for:
  - Choice of method (Euler or RK4)
  - Range of independent variable
  - Step size
  - Initial conditions
- Computes:
  - Exact (true) solution
  - Numerical solution
  - Percent relative error
- Displays:
  - Tabulated results
  - Graph comparing exact vs numerical solutions
- Includes basic error handling for invalid inputs

---

## Numerical Methods Used

### 1. Euler’s Method
A first-order method that approximates solutions step-by-step using slope.

### 2. Runge-Kutta Method (RK4)
A higher-order method that provides better accuracy using weighted averages of slopes.

---

## How to Run

1. Open MATLAB  
2. Run the script:

```matlab
my_mp2
```
Follow the prompts:
```text
Choose method (1 or 2)

Enter range of values

Enter initial condition

Enter step size
```

---

## Sample Workflow

```text
Choose Analytic Method to be used:
1) Euler’s Method
2) Runge-Kutta Method

What is your choice? 1

Enter the lower limit for t range: 0
Enter the upper limit for t range: 4
Enter the value for y at t = 0: 2
Enter the interval or step size: 1
```
---

## Output

Table of:

- Exact solution

- Numerical solution

- Percent relative error

Graph showing:

- Exact solution curve

- Numerical approximation

---

## Important Notes

Analytical solution is required before coding

Code must include:

  1. Comments explaining key steps

  2. Input validation

Ensure correct comparison between exact vs numerical results

---

## Project Structure
```
/project-folder
│── my_mp2.m             # Main MATLAB script
│── README.md            # Project documentation
│── documentation.pdf    # Full report (derivation + outputs)
```

---

## Notes

Include full analytical derivation in documentation

Provide screenshots of:

- Program output

- Plots

Verify correctness of results manually

---

## Summary

This project demonstrates:

- Solving differential equations analytically

- Implementing numerical methods in MATLAB

- Comparing accuracy of numerical techniques

---
