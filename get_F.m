function F = get_F(Ca, Aa, Np)
    % This function calculates the prediction matrix F
    % Inputs:
    %   Ca - Output matrix
    %   Aa - Augmented state transition matrix
    %   Np - Prediction horizon
    % Output:
    %   F  - Prediction matrix

    % Display sizes of Ca and Aa for verification
    disp(size(Ca));
    disp(size(Aa));
    
    % Initialize the F matrix
    F = Ca * Aa;
    
    % Loop to calculate the subsequent rows of F
    for i = 1:(Np - 1)
        F = [F; Ca * (Aa^(i + 1))];
    end
end
