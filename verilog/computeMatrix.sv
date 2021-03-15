module computeMatrix #(parameter N=1, 
                       parameter W=1)
                      (input logic signed [W:0] x[N][1:0],
                       output logic signed [W+N-1:0] X[N][1:0]);
  
  localparam theta = -2*$acos(-1)/N;
  // Computation of the Fourier matrix
  always_comb  
    for(int k=0; k<N; k++)begin
      X[k][1:0] = {0,0};
      for(int j=0; j<N; j++)begin
        X[k][0] = X[k][0]+($cos(theta*k*j)*x[j][0])-($sin(theta*k*j)*x[j][1]);
        X[k][1] = X[k][1]+($cos(theta*k*j)*x[j][1])+($sin(theta*k*j)*x[j][0]);
      end
    end
  
endmodule: computeMatrix