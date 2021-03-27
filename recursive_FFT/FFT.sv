parameter BIT_INT = 16;
parameter BIT_FRAC = 16;
parameter W = BIT_INT+BIT_FRAC;

`include "butterfly.sv"
`include "computeMatrix.sv"
`include "swap.sv"
`include "divbyN.sv"

module FFT #(parameter N = 1, parameter W=1)
            (input logic signed [W:0] x[N][1:0],
             output logic signed [W+N-1:0] X[N][1:0]);
            
  logic signed [W:0] xe[N/2][1:0], xo[N/2][1:0];
  logic signed [W+N/2-1:0] Xe[N/2][1:0], Xo[N/2][1:0];
  
  always_comb 
    for(int k=0; k<N/2; k++)begin
      xe[k][1:0] = x[2*k][1:0];
      xo[k][1:0] = x[2*k+1][1:0];
    end
           
  if(!N[0]) begin  
    butterfly #(.N(N), .W(W)) m_butterfly(.Xe(Xe), .Xo(Xo), .X(X));
    
    FFT #(.N(N/2), .W(W)) FFT_e(.x(xe), .X(Xe));
    FFT #(.N(N/2), .W(W)) FFT_o(.x(xo), .X(Xo));   
  end
  
  else computeMatrix #(.N(N), .W(W)) Matrix(.x(x), .X(X));
  
endmodule: FFT

module iFFT #(parameter N = 1)
            (input logic signed [W:0] x[N][1:0],
             output logic signed [W+N-1:0] X[N][1:0]);
  
  logic signed [W:0] x_in[N][1:0];
  logic signed [W+N-1:0] Xa[N][1:0];
  logic signed [W+N-1:0] Xb[N][1:0];
  
  swap #(.N(N), .W(W)) swap_in(.x(x), .y(x_in));
  FFT #(.N(N), .W(W)) mFFT(.x(x_in), .X(Xa));
  swap #(.N(N), .W(W+N-1)) swap_out(.x(Xa), .y(Xb));
  divbyN #(.N(N), .W(W+N-1)) divN(.x(Xb), .y(X));
  
endmodule: iFFT

module RecursiveFFT #(parameter N = 1, 
                      parameter W = 1,
                      parameter sel = 1)
                     (input logic signed [W:0] x[N][1:0],
                      output logic signed [W+N-1:0] X[N][1:0]);

  if(!sel)
    FFT #(.N(N), .W(W)) mFFT(.x(x), .X(X));
  else
    iFFT #(.N(N), .W(W)) miFFT(.x(x), .X(X));
 
endmodule: RecursiveFFT