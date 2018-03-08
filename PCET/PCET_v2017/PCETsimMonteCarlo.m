function MCsim = PCETsimMonteCarlo(PCETsys, MCRHSfile, MCOUTfile, samples, simoptions, varargin)
% MCsim = PCETsimMonteCarlo(PCETsys, 'MCRHSfile', 'MCOUTfile', samples, simoptions)
% simulates the system PCETsys and returns a struct containing the
% Monte-Carlo trajectories for all states and outputs in PCETsys.
%
% - PCETsys is the system struct returned by PCETcompose
% - MCRHSfile is a string containing the filename of the states'
%   right-hand-sides, which can be created using PCETwriteFiles
% - MCOUTfile is a string containing the filename of the output'
%   right-hand-side, which can be created using PCETwriteFiles
% - samples is either an integer defining the number of Monte-Carlo-samples
%   or a struct containig samples for all variables, which can be created
%   using PCETsample(PCETsys, 'variables', N)
% - simoptions is a struct with fields 
%   .setup   -  odeset-struct
%   .solver 	-  string containing the solver's name; default is 'ode15s'
%   .tspan   -  vector [t_0, t_end] or [t_0, t_1, ..., t_end]
%   .dt      -  double defining the stepwidth of the solver's output;
%               if tspan is a vector of more than two timepoints, setting
%               dt will overwrite these values
% 
% MCsim = PCETsimMonteCarlo(..., 'method', 'final')
% returns a struct only containing the values of all states and outputs at 
% time simoptions.tspan(end)
%
% MCsim = PCETsimMonteCarlo(..., 'method', 'moments')
% returns a struct containing the central moments of all states and outputs
% which are calculated recursively during the simulation in order to save
% memory
%
% MCsim = PCETsimMonteCarlo(..., 'in1', data1, ..., 'inN', dataN)
% simulates the system with inputs 'in1' to 'inN'. The inputs' names and
% data have to match those specified in PCETsys.inputs (see the examples
% for more details on working with inputs).

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
