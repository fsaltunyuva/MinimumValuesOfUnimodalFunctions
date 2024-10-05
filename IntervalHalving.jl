function intervalHalving(func, a::Float64, b::Float64, maxIteration::Int64, ϵ::Float64)
   α = (a + b) / 2 # Initial guess
   k = 0 # Iteration counter

   for k in 1:maxIteration
        L = b - a # Interval length
        x1 = a + L / 4 # Midpoint of the first quarter
        x2 = b - L / 4 # Midpoint of the last quarter

        f1 = func(x1) # Evaluate the function at x1
        f2 = func(x2) # Evaluate the function at x2
        fα = func(α) # Evaluate the function at α

        if f1 < fα # If f1 is less than fα
            b = α # Set b to α
            α = x1 # Set α to x1
            fα = f1 # Set fα to f1
        elseif f2 < fα # If f2 is less than fα 
            a = α # Set a to α
            α = x2 # Set α to x2
            fα = f2 # Set fα to f2
        else
            a = x1 # Set a to x1
            b = x2 # Set b to x2
        end

        # L = b - a 

        if abs(L) < ϵ # If the interval length is less than the tolerance
            println("Converged.")
            return α, fα # Return the result
        end
   end
end

result = intervalHalving(x -> x^2+x, -1.0, 1.0, 100, 0.0001)
println("Result: ", result)