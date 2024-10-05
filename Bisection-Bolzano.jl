function derivative(f, x::Float64, h::Float64 = 1e-10) # Derivative function
    return (f(x + h) - f(x)) / h
end

function bisection(func, a::Float64, b::Float64, ϵ::Float64, maxIteration::Int64)
    k = 0 # Iteration counter

    for k in 1:maxIteration
        α = (a + b) / 2 # Midpoint of the interval
        if(derivative(func, α) < 0) # If the derivative is less than zero
            a = α # Set a to α
        else
            b = α # Set b to α
        end

        if abs(a - b) < ϵ # If the difference between a and b is less than the tolerance
            println("Converged.")
            return a, func(a)
        end
    end
end

result = bisection(x -> x^2+x, -1.0, 1.0, 0.0001, 100)
println("Result: ", result)