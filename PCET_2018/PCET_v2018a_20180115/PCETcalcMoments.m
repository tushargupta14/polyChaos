function out = PCETcalcMoments(PCETsys, MomMats, pcvals, type, M)
% moments = PCETcalcMoments(PCETsys, MomMats, pcvals) 
% calculates the central moments of a variable from its PCE
% coefficients pcvals which are returned by PCETsimGalerkin or
% PCETsimCollocation, respectively. Only the first M=SIZE(MomMats,1)
% moments are calculated. 
% If pcvals is a matrix of PCE coefficients, PCETcalcMoments will return a 
% M-by-size(pcvals,2) matrix containing where each row contains the 
% moment of corresponding order (1st row -> 1st central moment, ...).
% If pcvals is a struct, PCETcalcMoments returns a struct containing the
% moments of all variables in pcvals.
% 
% moments = PCETcalcMoments(PCETsys, MomMats, pcvals, 'raw')
% returnes the raw moments instead.
%
% moments = PCETcalcMoments(PCETsys, MomMats, pcvals, ..., M)
% returnes moments up to order M with M <= SIZE(MomMats,1).
%
% Example: 
%  PCETcalcMoments(PCETsys, MomMats, results.x1.pcvals(:,end), 'raw', 2) 
%  returns the first two raw moments of x1 at the end of the simulation.

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
