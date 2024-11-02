function derivative(f, x::Float64, h::Float64 = 1e-10) # Derivative function
    return (f(x + h) - f(x)) / h
end

function second_derivative(f, x::Float64, h::Float64 = 1e-5)
    return (f(x + h) - 2 * f(x) + f(x - h)) / (h^2)
end

function newtonRaphson(func, x0::Float64, maxIteration::Int64, ϵ::Float64)
    x = x0  # Initial guess

    for k in 1:maxIteration
        f_prime_x = derivative(func, x) # Evaluate the derivative at x
        f_double_prime_x = second_derivative(func, x)  # Second derivative

        if abs(f_double_prime_x) < 1e-12  
            println("Second derivative is zero, cannot determine minimum.")
            return x, f(x)
        end

        x_next = x - f_prime_x / f_double_prime_x # Update x   

        if abs(x_next - x) < ϵ # If the difference between x_next and x is less than the tolerance  
            println("Converged. Completed in $k iterations. ")
            return x_next, func(x_next)
        end

        x = x_next 
    end

    println("Max iteration reached.")
    return x, func(x) 
end

result = newtonRaphson(x -> x^2+2, -1.0, 100, 0.0001)
println("Result: ", result)