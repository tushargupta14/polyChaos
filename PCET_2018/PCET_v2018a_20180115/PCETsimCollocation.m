function results = PCETsimCollocation(PCETsys, MCRHSfile, MCOUTfile, BasisSamples, simoptions, varargin)
% PCETsim = PCETsimCollocation(PCETsys, 'MCRHSfile', 'MCOUTfile', BasisSamples, simoptions) 
% simulates the system PCETsys and returns a struct containing the PCE
% coefficients for all states and outputs specified in PCETsys 
% The coefficients are calculated via the stochastic collocation method. 
% 
% - PCETsys is the system struct returned by PCETcompose
% - MCRHSfile is a string containing the filename of the states'
%   right-hand-sides, which can be created using PCETwriteFiles
% - MCOUTfile is a string containing the filename of the system's output,
%   which can be created using PCETwriteFiles
% - samples is either an integer defining the number of collocation-points
%   or a matrix containig basis samples, which can be created using
%   PCETsample(PCETsys, 'basis', N)
% - simoptions is a struct with fields 
%   .setup   -  odeset-struct
%   .solver 	-  string containing the solver's name; default is 'ode15s'
%   .tspan   -  vector [t_0, t_end] or [t_0, t_1, ..., t_end]
%   .dt      -  double defining the stepwidth of the solver's output;
%               if tspan is a vector of more than two timepoints, setting
%               dt will overwrite these values
%
% PCETsim = PCETsimCollocation(..., 'method', 'final')
% returns a struct only containing the PCE coefficient values of all states
% and outputs at time simoptions.tspan(end)
%
% PCETsim = PCETsimCollocation(..., 'in1', data1, ..., 'inN', dataN) 
% simulates the system with inputs. The inputs' names and data have to
% match those specified in PCETsys.inputs (see examples for more details on
% working with inputs).


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
