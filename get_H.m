function H = get_H(P,Nc, C_c, prediction_weight)

Rw = zeros(size(C_c,1), 1);
Rb = Rw(1)*(prediction_weight*eye(Nc));
for i = 2:size(C_c,1)
    Rb = blkdiag(Rb, Rw(i)*(prediction_weight*eye(Nc)));
end
H = P'*P+Rb;