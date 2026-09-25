//Parameterised Carry Look Ahead Adder Module

module cla #(
	parameter N=4)(                // Declearation of Bit Size By parameter
	input[(N-1):0] A,B,            // Input A,B declearation
	input Cin,                     // carry input
	output[(N-1):0] Sum,           // Output SUM
	output Cout);                  // Output Carry

wire carry[N:0];                       // Internal Carries

assign carry[0]=Cin;                   // Assign Input Carry
assign Cout=carry[N];                  // Assign output Carry

genvar i;
generate
	for(i=0; i<N; i=i+1) begin
		test T(.A(A[i]), .B(B[i]), .Cin(carry[i]), .S(Sum[i]), .C(carry[i+1]));   //Number of Full Adder repetation for N bit carry 
	end 
endgenerate
endmodule
