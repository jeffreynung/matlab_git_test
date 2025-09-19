function [putPrice, callPrice] = blackScholes(spotPrice, K, interestRate, timeToExpiration, volatility)
    % Calculate the Black-Scholes put and call option prices
    d1 = (log(spotPrice / K) + (interestRate + 0.5 * volatility^2) * timeToExpiration) / (volatility * sqrt(timeToExpiration));
    d2 = d1 - volatility * sqrt(timeToExpiration);
    
    putPrice = K * exp(-interestRate * timeToExpiration) * normcdf(-d2) - spotPrice * normcdf(-d1);
    callPrice = spotPrice * normcdf(d1) - K * exp(-interestRate * timeToExpiration) * normcdf(d2);
end