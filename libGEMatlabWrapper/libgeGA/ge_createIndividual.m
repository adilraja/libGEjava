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
% ## @deftypefn {Function File} {@var{retval} =} createIndividual (@var{input1}, @var{input2})
% ##
% ## @seealso{}
% ## @end deftypefn
% 
% ## Author: FGFS <fgfs@fgfs-Precision-WorkStation-T3500>
% ## Created: 2017-03-16

function individual = ge_createIndividual (genome_length, grammar)
    rng(0,'twister');
    %genotype=randi([0 500000], 1, genome_length);
    
    individual=struct('genome', randi([0 500000], genome_length, 1), 'fitness', 500000, 'ID', [0 0], 'left_parent', [0 0], 'right_parent', [0 0], 'isEvaluated', 0, 'age', 0, 'result', []);
    [phenotype_string grammar]=genotype2phenotype(individual.genome, grammar);
    individual.grammar=grammar;% Trying to assign the grammar object to this struct as a field. I hope this works.
    individual.string=phenotype_string;
    s=individual.string;
    individual.valid=grammar.isPhenotypeValid();%
    %individual.img=rand(300,300);
    %individual.fitness=500000;
end
