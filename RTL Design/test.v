// Full adder configuration For Ripple Carry Ahead Adder

module test(
input A,B,Cin,      // Input A,B and Carry In
output S, C);       // SUM and Output Carry

wire G,P;            

assign G= A & B;              // Carry Generate
assign P= A ^ B;              // Carry Propagation
assign S= P ^ Cin;            // SUM Declearation
assign C= G | (P & Cin);      //Carry Declearation

endmodule
