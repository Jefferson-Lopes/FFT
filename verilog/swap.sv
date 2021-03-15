module swap #(parameter N=1, parameter W=1)
             (input logic signed [W:0] x[N][1:0],
              output logic signed [W:0] y[N][1:0]);
  
  always_comb 
    for(int k=0; k<N; k++)begin
      y[k][0] = x[k][1];
      y[k][1] = x[k][0];
    end
endmodule: swap
