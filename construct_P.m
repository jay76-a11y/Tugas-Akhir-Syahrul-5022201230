function P = construct_P(Ca, Aa, Ba, Nc, Np)
    % Initialize P with zeros
    P = zeros(size(Ca, 1), Nc * size(Ca, 1));
    
    % Set the first block of P
    P(:, 1:size(Ca, 1)) = Ca * Ba;
    
    % Loop to construct the rest of P
    for i = 1:Np-1
        % Get the previous block and roll (shift) it
        row = circshift(P(end-size(Ca, 1)+1:end, :), 1, 2);
        
        % Set the first column of the current block
        row(:, 1:size(Ca, 1)) = (Ca * Aa^i) * Ba;
        
        % Append the current block to P
        P = [P; row];
    end
end
