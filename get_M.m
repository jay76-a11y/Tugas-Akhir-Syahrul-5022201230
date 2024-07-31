function M = get_M(Nc, u_size)
    % This function calculates the constraint matrix M for MPC optimization
    % Inputs:
    %   Nc      - Control horizon
    %   u_size  - Number of control inputs
    % Output:
    %   M       - Constraint matrix

    % Create Ma matrix
    Ma = eye(Nc);
    Ma = [Ma; -eye(Nc)];
    Ma = [Ma; tril(ones(Nc))];
    Ma = [Ma; -tril(ones(Nc))];

    % Initialize Mr with Ma
    Mr = [];
    Mr = [Mr, Ma];
    
    % Repeat Ma vertically for each control input
    for i = 2:u_size
        Mr = [Mr; Ma];
    end

    % Initialize M with Mr
    M = [];
    M = [M, Mr];

    % Repeat Mr horizontally for each control input
    for i = 2:u_size
        M = [M, Mr];
    end
end
