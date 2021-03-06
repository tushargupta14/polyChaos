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
%      (Polynomial Chaos Expansion Toolbox for Matlab)
% 
%    LICENSER and COPYRIGHT OWNER: 
%       Stefan Streif, Technische Universitaet Chemnitz, Germany
%       http://www.TU-Chemnitz.de/etit/control/
% 
%    CONTACT: stefan.streif@etit.tu-chemnitz.de
% 
%    EXPIRATION DATE: 171231
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
%       mentioned with the following citations:
%       [1] S. Streif, F. Petzke, A. Mesbah, R. Findeisen, R. D. Braatz.
%           Optimal experimental design for probabilistic model
%           discrimination using polynomial chaos. In Proc. 19th
%           IFAC World Congress, pages 4103-4109, Cape Town,
%           South Africa, 2014.
%       [2] F. Petzke, A. Mesbah, S. Streif.
%           Polynomial Chaos Expansion Toolbox for Matlab.
%           Online http://www.TU-Chemnitz.de/etit/control/PCET/
%           Technische Universitaet Chemnitz, Laboratory for
%           Automatic Control and System Dynamics, Germany, 2015.
%    6. The LICENSER reminds the user that for using PCET, the commercial 
%       program MATLAB is required. In order to get a fully functional 
%       version of PCET, the user has to obtain the appropriate licenses.
%    7. This version of PCT may not be used after the expiration date.
%       A new version will be made available upon request. 
% 
% =========================================================================
