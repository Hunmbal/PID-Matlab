clc;
syms X1 X2 F s M1 M2 D1 D2 K

% Inputted my equations here
eq1 = F == X1*(M1*s^2 + D1*s + K) - X2*K;
eq2 = 0 == -X1*K + X2*(M2*s^2 + D2*s + K);

% Solving equations
X2_sol = solve(eq2, X2);
eq1_sub = subs(eq1, X2, X2_sol);
X1_sol = solve(eq1_sub, X1);
transfer_function = simplify(s*X1_sol/F);

% Simplification process:
[num, den] = numden(transfer_function);
den_simplified = collect(den, s);
pretty(num/den_simplified)