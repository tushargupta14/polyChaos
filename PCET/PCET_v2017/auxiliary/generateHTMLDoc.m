function generateHTMLDoc(filename, output_directory, title)
% generateHTMLDoc(filename, [output_directory, [file_extension, title]])
%
% THIS FUNCTION IS USED FOR INTERNAL PURPOSES ONLY. DO NOT CALL DIRECTLY.
%
% generateHTMLDOC Generates a HTML documentation out of the help text
% of an m-File.
%
% filename: Name of the m-File
% output_directory (optional, default: '.'): Output directory of the html-file
% title (optional): Title of the HTML-File. If not given, then the title is
% determined by the name of the m-file. The title can also be set in the
% documentation comment using a double percent sign.
% Example:
% %% This is the title
% % This is the other text.
%
% See the comments in the source code for details.

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
