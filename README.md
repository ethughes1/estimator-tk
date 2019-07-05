# estimator-tk
Project Lua Estimator Toolkit is a repository of rudimentary estimation routines including interpolation, multiple linear regression, and supporting data structures.

This script estimates y = F(x) such that F(x) = x * x for x = 1, 2, 3

let P(x) = c0 + c1(x - x0) + c2(x - x0)(x - x1) where

| x | 1.0 | 2.0 | 3.0
| --|-----|-----|-----
| y | 1.0 | 4.0 | 9.0

c0 = y0
c1 = (y1 - c0) / (x1 - x0)
c2 = (y2 - c0 - c1(x2 - x0)) / (x2 - x0)(x2 - x1))


| x    | F(x)  | P(x)  | Residual
| -----|-------| ------| ------------
| 1.00 | 1.00  | 1.00  |  0.00
| 2.00 | 4.00  | 4.00  |  0.00
| 3.00 | 9.00  | 9.00  |  0.00
| 1.50 | 2.25  | 2.25  |  0.00

Then, it creates a table from which multiple linear regression can be used to estimate the price of a pistol that is not in the table.

| Pistol               | Mass (g)  |  Length (mm) | Barrel Length (mm) |   Capacity  | LN(Price ($))
| ---------------------| --------- | ------------ | ------------------ | ------------| -------------
| 9mm Walther P99      |      700  |          180 |               102  |          16 |     6.477
| 0.45 ACP HK USP      |      748  |          194 |               108  |          12 |     6.685
| 0.45 ACP Colt 1911A1 |     1100  |          210 |               127  |           8 |     6.685
| 9mm Berretta 92FS    |      945  |          217 |               125  |          10 |     6.477
| 9mm Sig Arms P226    |      964  |          196 |               112  |          15 |     6.745
| 0.50 AE Desert Eagle |     2024  |          273 |               152  |           7 |     7.131
