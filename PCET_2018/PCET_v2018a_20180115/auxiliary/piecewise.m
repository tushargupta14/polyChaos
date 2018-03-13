function out = piecewise(tvec,vvec,t)
% out = piecewise(tvec,vvec,t) 
% returns 
%  0          for             t <  tvec(1)
%  vvec(i)    for  tvec(i) >= t >  tvec(i+1)
%  vvec(end)  for             t >= tvec(end)
% 
%  'tvec' is a vector containing the time-points, at which the 
%  input value changes.
%
%  'vvec' is a vector containing the values, the function takes 
%  at the specified timepoints.
%
%  't' is the timepoint, at which the function is evaluated.
%
% In simulations, specify tvec and vvec as input parameters and
% piecewise(tvec,vvec,t) as the input function, where t will be 
% interpreted as the simulation time.

% ====== LICENSE AND COPYRIGHT INFORMATION ================================
% 
%    This file is part of PCET 
%      (Polynomial Chaos Expansion Toolbox).
% 
%    LICENSER and COPYRIGHT OWNER: 
%      Stefan Streif, Germany
% 
%    CONTACT: stefan.streif@tu-ilmenau.de
% 
%    PUBLICATION:
%      [...]
% 
%    EXPIRATION DATE: 181231
%    
%    LICENSING CONDITIONS AND COPYRIGHT INFORMATION:
%    -----------------------------------------------
%    1. PCET can be used without any fee for academic and non-commercial
%       purposes only.
%    2. The LICENSER does not adhere to any problems that arise directly
%       or indirectly from using PCET. PCET is distributed in the hope
%       that it will be useful but WITHOUT ANY WARRANTY; without even the
%       implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
%       PURPOSE.
%    3. The copyright for PCET remains with the LICENSER. 
%    4. The user is not allowed to distribut PCET without permission of the
%       LICENSER.
%    5. When publishing results gained by using PCET, PCET has to be
%       mentoned with appropriate citations
%       (ask the LICENSER for an appropriate list of references).
%    6. The LICENSER reminds the user that for using PCET, 
%       the commercial program MATLAB is required. In order to get a 
%       fully functional version of PCET, the user 
%       has to get the appropriate licenses himself.
%    7. This version of PCT may not be used after the expiration date.
% 
% =========================================================================
