function [putPrice, callPrice] = blackScholes(spotPrice, strikePrice, interestRate, timeToExpiration, volatility)
    % Calculate the Black-Scholes put and call option prices
    d1 = (log(spotPrice / strikePrice) + (interestRate + 0.5 * volatility^2) * timeToExpiration) / (volatility * sqrt(timeToExpiration));
    d2 = d1 - volatility * sqrt(timeToExpiration);
    
    putPrice = strikePrice * exp(-interestRate * timeToExpiration) * normcdf(-d2) - spotPrice * normcdf(-d1);
    callPrice = spotPrice * normcdf(d1) - strikePrice * exp(-interestRate * timeToExpiration) * normcdf(d2);
end