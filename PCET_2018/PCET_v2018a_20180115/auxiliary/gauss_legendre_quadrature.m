function [X W] = gauss_legendre_quadrature(N)
% [X W] = gauss_legendre_quadrature(N)
%
% Find the Gauss-Legendre abscissae and weights.
%
% Arguments:
%  N - The number of abscissae and weights to return.
%
% Return Values:
%  X - A column vector containing the abscissae.
%  W - A column vector containing the corresponding weights.
%
% Gauss-Legendre quadrature approximates definite integrals of the form
%
%     \int^{-\infty}_{\infty} dx W(x) f(x)
%
% where
%
%     W(x) = 1
%
% with the sum
%
%     \sum_{n=1}^{N} w_{n} f(x_{n}).
%
% This function returns the set of abscissae and weights
%
%     {x_{n}, w_{n}}^{N}_{n=1}
%
% for performing this calculation given N, the number of abscissae.
% These abscissae correspond to the zeros of the Nth Hermite
% polynomial.  It can be shown that such integration is exact when f(x)
% is a polynomial of maximum order 2N-1.
%
% The procedure in this calculation is taken more or less directly from
%
% @BOOK{ press-etal-1992a,
%  AUTHOR   = { Press, William  H.   and 
%               Flannery, Brian  P.  and
%               Teukolsky, Saul  A.  and
%               Vetterling, William  T. },
%   ISBN      = {0521431085},
%	MONTH     = {October},
%	PUBLISHER = {{Cambridge University Press}},
%	TITLE     = {Numerical Recipes in C : The Art of Scientific Computing},
%	YEAR      = {1992}
% }
%

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
