module butterfly #(parameter N=1, 
                   parameter W=1)
                  (input logic signed [W+N/2-1:0] Xe[N/2][1:0], 
                   input logic signed [W+N/2-1:0] Xo[N/2][1:0],
                   output logic signed [W+N-1:0] X[N][1:0]);
                     
  logic signed [W+N/2:0] G[N][1:0];
  
  localparam theta = -2*$acos(-1)/N;
  
  always_comb  
    for(int k=0; k<N/2; k++)begin
      // Nodes on the butterfly
      G[k][0] = ($cos(theta*k)*Xo[k][0])-($sin(theta*k)*Xo[k][1]);
      G[k][1] = ($cos(theta*k)*Xo[k][1])+($sin(theta*k)*Xo[k][0]);

      // Butterfly computation
      X[k][0] = Xe[k][0]+G[k][0];
      X[k][1] = Xe[k][1]+G[k][1];
      
      X[k+N/2][0] = Xe[k][0]-G[k][0];
      X[k+N/2][1] = Xe[k][1]-G[k][1];
     end
  
endmodule: butterfly