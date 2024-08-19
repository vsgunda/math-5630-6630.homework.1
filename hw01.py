# Author: Your Name / your_email
# Date: 2024-09-01
# Assignment Name: hw01

import sys
import numpy as np

def p1():
    """
    This function only contains comments. Fill the following table. Do not write any code here.

    commands                                      |  results            | explanations
    ----------------------------------------------|---------------------|----------------
    import sys;sys.float_info.epsilon             |                     |
    import sys;sys.float_info.max                 |                     |
    import sys;sys.float_info.min                 |                     |
    import sys;1 + sys.float_info.epsilon - 1     |                     |
    import sys;1 + sys.float_info.epsilon /2 - 1  |                     |
    import sys;sys.float_info.min/1e10            |                     |
    import sys;sys.float_info.min/1e16            |                     |
    import sys;sys.float_info.max*10              |                     |
    """

def p2(n, choice):
    """
    This function computes the Archimedes' method for pi.
    @param n: the number of sides of the polygon
    @param choice: 1 or 2, the formula to use
    @return: s_n, the approximation of pi using Archimedes' method.

    
    Tabulate the error of |s_n - pi| for n = 0, 1, 2, ... 15 and choices n = 1, 2
    for both choices of formulas.
    
    n     | choice 1 | choice 2
    ------|----------|----------
    0     |          |
    1     |          |
    2     |          |
    3     |          |
    4     |          |
    5     |          |
    6     |          |
    7     |          |
    8     |          |
    9     |          |
    10    |          |
    11    |          |
    12    |          |
    13    |          |
    14    |          |
    15    |          |
 

    Explanation of the results:


    """

    # Write your code here

    if choice == 1:
        # Use the 1st formula 
        pass
    else:
        # Use the 2nd formula
        pass

def p3(a):
    """
    This function implements the Kahan summation algorithm. 

    @param a: a 1D numpy array of numbers
    @return: the Kahan sum of the array
    """
    return 0 # Write you code here.

def p4(a):
    """
    This function tests the performance of Kahan summation algorithm 
    against naive summation algorithm.

    @param a: a 1D numpy array of numbers
    @return: no return

    @task: Test this function with a = np.random.rand(n) with various size n multiple times. Summarize your findings below.

    @findings:





    """
    single_a = a.astype(np.float32) # Convert the input array to single precision
    s = p3(a) # Kahan sum of double precision as the ground truth
    single_kahan_s = p3(single_a) # Kahan sum of single precision
    single_naive_s = sum(single_a) # Naive sum of single precision

    print(f"Error of Kahan sum under single precision: {s - single_kahan_s}")
    print(f"Error of Naive sum under single precision: {s - single_naive_s}")

def p5(a):
    """
    For 6630. 

    This function computes summation of a vector using pairwise summation.
    @param a: a vector of numbers
    @return: the summation of the vector a using pairwise summation algorithm.

    @note: You may need to create a helper function if your code uses recursion.

    @task: Rewrite the p4 test function to test this summation method. Summarize your findings below.
    
    @findings: 
    
    
    
    
    
    """

    return 0 # Write your code here.