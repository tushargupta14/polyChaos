function samples = PCETsample(PCETsys, type, varargin)
% samples = PCETsample(PCETsys, 'variables', N)
% returns a struct containing N samples of all initial conditions and 
% parameters in the system specified by PCETsys, which is a struct created
% with PCETcompose.
%
% samples = PCETsample(PCETsys, 'basis', N)
% returns a N_PHI-by-N matrix containing the values of the polynomial chaos 
% basis functions evaluated at N samples of the random variables of the
% system PCETsys. N_PHI is the number of terms used for the PCE.
%
% samples = PCETsample(PCETsys, 'PCE', N, pcvals)
% returns a N-by-SIZE(pcvals,2) matrix containing samples that are
% calculated from the polynomial chaos coefficients 'pcvals'.
%
% samples = PCETsample(PCETsys, 'PCE', [], pcvals, basis)
% returns a SIZE(basis,2)-by-SIZE(pcvals,2) matrix containing samples that
% are calculated from the polynomial chaos coefficients 'pcvals' and the
% evaluated basis functions 'basis'.

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
