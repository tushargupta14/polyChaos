function MomMats = PCETmomentMatrices(PCETsys, M)
% MomMats = PCETmomentMatrices(PCETsys, M) 
% returns a struct array of size (M-1)-by-1 containing the matrices
% required to calculate the second to M-th moments of a variable from its
% PCE-coefficients. 
% NOTE: computation times increase exponentially with M!

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
