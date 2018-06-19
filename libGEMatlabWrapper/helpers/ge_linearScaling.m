function [intercept, slope]=ge_linearScaling(evolved,target)
%This is the version of linear scaling as proposed by Maarten Keijzer for
%symbolic regression.
i=0;
if length(evolved) ~= length(target)
     printf('No of Target Values is not the same as Evolved Values');
     printf('Exiting .... ');
     exit(0);
 end
 
 meanTarget = mean(target);
 meanEvolved = mean(evolved);
 
 b = 1; a=0; numerator=0;denominator=0;
 
      factor = evolved-meanEvolved;
     numerator= sum((target-meanTarget).*factor);
     denominator =sum(power(factor,2));
     slope=1;
 if denominator~=0     slope=numerator/denominator;
   elseif  (meanEvolved == 0)  slope = 1;
   else slope = meanTarget / meanEvolved;
 end
 intercept=meanTarget - slope*meanEvolved; 