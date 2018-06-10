% ## Copyright (C) 2017 FGFS
% ## 
% ## This program is free software; you can redistribute it and/or modify it
% ## under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with this program.  If not, see <http://www.gnu.org/licenses/>.
% 
% ## -*- texinfo -*- 
% ## @deftypefn {Function File} {@var{retval} =} Crossover (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: FGFS <fgfs@fgfs-Precision-WorkStation-T3500>
% ## Created: 2017-03-16

function [c_ind1, c_ind2] = ge_rossover (ind1, ind2, genome_length, grammar)

genome1=ind1.genome;
genome2=ind2.genome;
%genome_length=length(genome1);
y=genome_length;

  y2=floor(rand(1)*(genome_length-1))+1;
%  y2=y/2;

 % c_genome1=zeros(x, y);
  c_genome1(1:y2)= genome1(1:y2);
  c_genome1(y2+1:y)=genome2(y2+1:y);
  flip_prob=rand(1);

%  c_genome2=zeros(x, y);
  c_genome2(1:y2)= genome2(1:y2);
  c_genome2(y2+1:y)=genome1(y2+1:y);

  c_ind1=ge_createIndividual(genome_length, grammar);
  c_ind2=ge_createIndividual(genome_length, grammar);

  c_ind1.genome=c_genome1;
  c_ind2.genome=c_genome2;
c_ind1.left_parent=ind1.ID;
c_ind1.right_parent=ind2.ID;

c_ind2.left_parent=ind2.ID;
c_ind2.right_parent=ind1.ID;

end
