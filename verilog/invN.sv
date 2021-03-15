module invN #(parameter N=1, parameter W=1, parameter BIT_FRAC=1)           
             (output logic signed [W:0] y);
  
  logic [W:0] A, T;
  always_comb begin
    A = 0;
    T=1<<BIT_FRAC;
    for(int k=BIT_FRAC; k>=0; k--)
      if(N<<k <= T)begin
        A = A+(1<<k);
        T = T-(N<<k);
      end
    y = A;    
  end
  
endmodule: invN
