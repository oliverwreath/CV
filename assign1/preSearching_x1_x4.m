function [ ret ] = preSearching_x1_x4( sum_vector_of_x, x1_or_x4, sum_up_Window, search_Window_x1_x4 )
%%%   Copyright (c) <2013>, Yanliang Han
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
% 1. Redistributions of source code must retain the above copyright
%    notice, this list of conditions and the following disclaimer.
% 2. Redistributions in binary form must reproduce the above copyright
%    notice, this list of conditions and the following disclaimer in the
%    documentation and/or other materials provided with the distribution.
% 3. Neither the name of the University of Illinois at Urbana-Champaign nor the
%    names of its contributors may be used to endorse or promote products
%    derived from this software without specific prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY Yanliang Han ''AS IS'' AND ANY
% EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL Yanliang Han BE LIABLE FOR ANY
% DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
% (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
% ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
% (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
% %

minSum1 = 9999999;
minSum2 = 9999999;
ret1 = x1_or_x4;
ret2 = x1_or_x4;

if x1_or_x4 ~= 1  %x4
    for i = x1_or_x4 : -1 : x1_or_x4 - search_Window_x1_x4
        if i < 1
            break ;
        end
        if i > size(sum_vector_of_x, 2)
            break ;
        end
        tempCount = 2 * sum_up_Window + 1;
        if i + sum_up_Window > size(sum_vector_of_x, 2);
        tempCount = tempCount - ( i + sum_up_Window - size(sum_vector_of_x, 2) );
        end
        tempSum = sum( sum_vector_of_x( i-sum_up_Window : min(i+sum_up_Window, size(sum_vector_of_x, 2)) ) );
        tempAve = tempSum / tempCount ;
        if minSum1 > tempAve
            minSum1 = tempAve;
            ret1 = i;
        end
    end

else %x1_or_x4
    for i = x1_or_x4 : x1_or_x4 + search_Window_x1_x4
        if i < 1
            break ;
        end
        if i > size(sum_vector_of_x, 2)
            break ;
        end
        tempCount = 2 * sum_up_Window + 1;
        if i - sum_up_Window < 1
        tempCount = tempCount - ( 1 - (i - sum_up_Window) );
        end
        tempSum = sum( sum_vector_of_x( max(i-sum_up_Window, 1) : i+sum_up_Window ) );
        tempAve = tempSum / tempCount ;
        if minSum2 > tempAve
            minSum2 = tempAve;
            ret2 = i;
        end
    end
end

if minSum1 < minSum2
    ret = ret1;
else 
    ret = ret2;
end

end

