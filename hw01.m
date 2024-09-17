% Author: Vishnu Gunda / vsg0005@auburn.edu
% Date: 2024-09-17
% Assignment Name: hw01

classdef hw01
    methods (Static)

        function p1()
            % This function only contains comments. Fill the following table. Do not write any code here.
            % :return: no returns

            % Write your result and explanation for each command here.
            % 
            % commands         |  results      | explanations
            % -----------------|---------------|-----------------------------------
            % eps              |2.2204e-16     | It returns the smallest possible positive value that will not see cancellation error if added to a number                                            
            % realmax          |1.7977e+308    | realmax returns the largest possible number that can be expressed in the machine's double precision floating point system with a leading digit being non zero 
            % realmin          |2.2251e-308    | realmin returns the smallest possible normalized number that can be expressed in the machine's double precision floating point system with a leading digit bring non zero (big negative number)
            % 1 + eps - 1      |2.2204e-16     | Any number smaller than epsilon would return a zero due to cancelation error. Is is the smallest absolute value that can be expressed in the system without getting rounded off
            % 1 + eps/2 - 1    |0              | Returns a zero due to cancellation error being present and the result being smaller than what the system can represent without being rounded off
            % realmin/1e10     |2.2251e-318    | Returns a number that will have a leading digit of zero expressed in the floating point system
            % realmin/1e16     |0              | Returns a zero. The number is smaller than what can be represented in the floating point system
            % realmax*10       |inf            | The number that would result is higher than what can be expressed in the matlab floating point system
        end

        function s_n = p2(n, choice)
            % This function computes the Archimedes' method for pi.
            % :param n: the number of sides of the polygon
            % :param choice: 1 or 2, the formula to use
            % :return: s_n, the approximation of pi using Archimedes' method.

            % Tabulate the error of |s_n - pi| for n = 0, 1, 2, ..., 15 and choice = 1 and 2.
            % for both choices of formulas.
            % n     | choice 1 | choice 2
            % ------|----------|----------
            % 0     |3.2250e-01|3.225090e-01
            % 1     |7.3797e-02|7.379766e-02
            % 2     |1.8067e-02|1.806729e-02
            % 3     |4.4935e-03|4.493562e-03
            % 4     |1.1219e-03|1.121946e-03
            % 5     |2.8039e-04|2.803964e-04
            % 6     |7.0093e-05|7.009347e-05
            % 7     |1.7523e-05|1.752301e-05
            % 8     |4.3807e-06|4.380732e-06
            % 9     |1.0952e-06|1.095182e-06 
            % 10    |2.7428e-07|2.737953e-07
            % 11    |7.2032e-08|6.844882e-08
            % 12    |1.8151e-08|1.711221e-08
            % 13    |-3.468e-08|4.278053e-09
            % 14    |1.8151e-08|1.069515e-09 
            % 15    |-7.177e-07|2.673808e-10

            % Explanation of the results (why there is a difference between the two choices):
            % The results start out being similar, but when n=9 they start
            % to deviate from each other. This is likely due to
            % cancellation error in the first equation. As pn gets smaller
            % it becomes near zero, so the numerator becomes zero. The
            % cancellation error is avoided in the second problem.

            % Equation 1
           if choice == 1
                if n < 0
                    fprintf('N must be greater than or equal to zero');
                elseif n == 0
                    pn = (1/(sqrt(3)));
                    s_n = ((2)^n) * 6 * pn;
                    error = s_n - pi;
                 fprintf('Error =: %d\n', error);   
                else
                    pn = (1/(sqrt(3)));
                    for i = 1:n
                        pn_1 = (sqrt(1 + ((pn)^2)) - 1) / pn;
                        pn = pn_1;
                    end
                    s_n = ((2)^n) * 6 * pn;
                    error = s_n - pi;
                    fprintf('Error =: %d\n', error);
                end
           
             % Equation 2
           elseif choice == 2
                 if n < 0
                    fprintf('N must be greater than or equal to zero');
                elseif n == 0
                    pn = (1/(sqrt(3)));
                    s_n = ((2)^n) * 6 * pn;
                    error = s_n - pi;
                 fprintf('Error =: %d\n', error);   
                else
                    pn = (1/(sqrt(3)));
                    for i = 1:n
                        pn_1 = pn / (1 + sqrt(1 + (pn)^2));
                        pn = pn_1;
                    end
                    s_n = ((2)^n) * 6 * pn;
                    error = s_n - pi;
                    fprintf('Error =: %d\n', error);
                end

            else
                fprintf('Choice Must Be Either One Or Two.')
           end
        end
            
        function s = p3(a)
            % This function computes the Kahan summation algorithm.
            % :param a: a vector of numbers
            % :return: summation of the vector a using Kahan summation algorithm
            
            s = 0;             % Initial sum (s_0 = 0)
            e = 0;             % Compensation error (e_0 = 0)
        
            % Loop through the vector a
            for j = 1:length(a)
                y = a(j) - e;   % Remove the compensation error
                t = s + y;      % Perform the summation
                e = (t - s) - y;  % Restore the rounding error
                s = t;          % Update the running sum
            end
            %fprintf('The sum is: %.10f\n', s);
        end

        function p4(a)
            % This function test the performance of Kahan summation algorithm against native sum.
            % :param a: a vector of numbers in double precision.
            % :return: no returns

            % Test this function with a = rand(n, 1) with various size n multiple times. 
            % Summarize your findings below.
            %
            % Findings:
            % With smaller vectors (smaller in terms of size) the results
            % were comparable with MATLAB's sum function. As the vector got
            % larger the error in the default sum function got larger
            % faster than the error in the Kahan summation. Interestingly
            % when I tested a vector with 1 million values between 0 and 1,
            % the error was the same. I believe that this happened because
            % the error accumulated so much that the difference between
            % kahan summation and the default summation became negligible.
            % This may also be a result of the limits of single precision
            % and there is also the fact the magnitude between the values
            % are small because they are limited to being between 0 and 1.
            % Kahan summation is most effective when the numbers being
            % summed vary more in magnitude than the tested vectors, so it
            % is reasonable to assume that Kahan summation is overall much
            % more precise than the MATLAB sum function.
            
            single_a = single(a); % Convert a to single precision
            s = hw01.p3(a); % Kahan sum of a under double precision (regarded as truth).

            single_Kahan_s = hw01.p3(single_a); % Kahan sum of single_a under single precision.
            single_naive_s = sum(single_a); % Naive sum of single_a under single precision.
   
            disp(['Error of naive sum under single precision: ', num2str(single_naive_s-s)]);
            disp(['Error of Kahan sum under single precision: ', num2str(single_Kahan_s-s)]);
        end

        function s = p5(a)
            % For 6630. 
            % This function computes summation of a vector using pairwise summation.
            % :param a: a vector of numbers
            % :return: the summation of the vector a using pairwise summation algorithm.

            % ! You may need to create a helper function if your code uses recursion.

            % Rewrite the p4 test function to test this summation method.
            % Summarize your findings below.
            %
            % Findings: 
            % As the numbers in a given vector got larger in both magnitude
            % and range the Kahan summation worked better than the Pairwise
            % summation. The Kahan summation had a smaller error than the
            % Pairwise summation but it was only better for the larger
            % magnitudes. At smaller magnitudes they both worked at
            % similar levels of accuracy.

            % Get the length of the input vector
            n = length(a);
            
            % Iterative pairwise summation process
            while n > 1
                % Pairwise summation: sum adjacent elements
                for i = 1:2:(n-1)
                    a((i+1)/2) = a(i) + a(i+1); % Sum pairs of elements
                end
                
                % If odd number of elements, move the last unpaired element
                if mod(n, 2) == 1
                    a((n+1)/2) = a(n);  % Move the last element to the new position
                end
                
                % Reduce the size of the array for the next iteration
                n = ceil(n / 2);
            end

            % The final result is the first element
            s = a(1);
            %fprintf('Pairwise Summation Result: %.10f\n', s);
        end
    end
end
