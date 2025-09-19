function [putPrice, callPrice] = blackScholes(S, KK, interestRate, timeToExpiration, volatility)
    % Calculate the Black-Scholes put and call option prices
    d1 = (log(S / KK) + (interestRate + 0.5 * volatility^2) * timeToExpiration) / (volatility * sqrt(timeToExpiration));
    d2 = d1 - volatility * sqrt(timeToExpiration);
    
    putPrice = KK * exp(-interestRate * timeToExpiration) * normcdf(-d2) - S * normcdf(-d1);
    callPrice = S * normcdf(d1) - KK * exp(-interestRate * timeToExpiration) * normcdf(d2);
end