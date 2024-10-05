function goldenSection(func, a::Float64, b::Float64, ϵ::Float64, maxIteration::Int64)
    r = (3-sqrt(5))/2 # Golden ratio
    
    x1 = a + r * (b - a) # Initial guess
    x2 = b - r * (b - a) # Initial guess
    
    f1 = func(x1) # Evaluate the function at x1
    f2 = func(x2) # Evaluate the function at x2
    
    k = 0 # Iteration counter

    for k in 1:maxIteration 
        if f1 > f2 # If f1 is greater than f2
            a = x1 # Set a to x1
            x1 = x2 # Set x1 to x2
            f1 = f2 # Set f1 to f2

            x2 = r * a + (1 - r) * b # Update x2
            f2 = func(x2) # Evaluate the function at x2
        else
            b = x2 # Set b to x2
            x2 = x1 # Set x2 to x1
            f2 = f1 # Set f2 to f1
             
            x1 = r * b + (1 -r) * a # Update x1
            f1 = func(x1) # Evaluate the function at x1
        end

        if abs(f1 - f2) < ϵ # If the difference between f1 and f2 is less than the tolerance
            println("Converged.")
            return x1, func(x1)
        end
    end
end

result = goldenSection(x -> x^2+x, -1.0, 1.0, 0.0001, 100)
println("Result: ", result)