`include "invN.sv"

module divbyN  #(parameter N=1, parameter W=1)
                (input logic signed [W:0] x[N][1:0],
                 output logic signed [W:0] y[N][1:0]);
  
  logic signed [W:0] inv_N;
  invN #(.N(N), .W(W), .BIT_FRAC(BIT_FRAC)) m_invN(.y(inv_N));
  
  int p = $clog2(N);
  
  localparam c = isPowerOfTwo(N);
  
  if(c) begin
    always_comb 
      for(int k=0; k<N; k++)begin
        y[k][0] = x[k][0]>>>p;
        y[k][1] = x[k][1]>>>p;
      end
  end  
  else begin  
    always_comb 
      for(int k=0; k<N; k++)begin
        y[k][0] = round(x[k][0]*inv_N);
        y[k][1] = round(x[k][1]*inv_N);
      end
  end
  
  function logic signed [W:0] round(logic signed [W:0] x);
    return (x+(1<<<(BIT_FRAC-1)))>>>BIT_FRAC;
  endfunction: round
  
  function logic isPowerOfTwo (input integer N);
    return (N != 0) && ((N & (N - 1)) == 0);
  endfunction: isPowerOfTwo
  
endmodule: divbyN

  
