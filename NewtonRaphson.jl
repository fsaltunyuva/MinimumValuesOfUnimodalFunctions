function derivative(f, x::Float64, h::Float64 = 1e-10) # Derivative function
    return (f(x + h) - f(x)) / h
end

function newtonRaphson(func, x0::Float64, maxIteration::Int64, ϵ::Float64)
    x = x0  # Initial guess

    for k in 1:maxIteration
        f_x = func(x) # Evaluate the function at x
        f_prime_x = derivative(func, x) # Evaluate the derivative at x

        if abs(f_prime_x) < 1e-12  
            println("Derivative is zero.")
            return x, f(x)
        end

        x_next = x - f_x / f_prime_x # Update x   

        if abs(x_next - x) < ϵ # If the difference between x_next and x is less than the tolerance  
            println("Converged.")
            return x_next, func(x_next)
        end

        x = x_next 
    end

    println("Max iteration reached.")
    return x, func(x) 
end

newtonRaphson(x -> x^2+x, -1.0, 100, 0.0001)