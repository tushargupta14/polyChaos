function [PCETsys] = PCETcompose(states, parameters, inputs, outputs, order)
% PCETsys = PCETcompose(states, parameters, inputs, outputs) 
% returns a struct containing the Polynomial Chaos Expansion of order 2 of 
% the system defined by the states-, parameters-, and inputs-structs used 
% as input arguments. See 'help PCET' for more information on how to define
% a system.
% 
% PCETcompose(states, parameters, inputs, outputs, order) additionally sets 
% the order of the Polynomial Chaos Expansion.
%
% NOTE: PCETcompose(s)      does the same as  PCETcompose(s,[],[],[],2)
%       PCETcompose(s,p)    does the same as  PCETcompose(s,p,[],[],2)
%       PCETcompose(s,p,i)  does the same as  PCETcompose(s,p,i,[],2)
%
% In order to simulate the composed system, first create its expanded
% right-hand-sides using PCETwriteFiles(PCETsys).

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
