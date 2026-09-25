//Testbench Module For Carry Look Ahead Adder

module cla_tb;
parameter N=4;

reg[(N-1):0] A,B;           //Input A and B
reg Cin;                    // Carry Input
wire[(N-1):0] Sum;          // Output SUM
wire Cout;                  // Carry Output

cla uut(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

initial begin
$display("********************* Verification Started ***************************");
$display("");
$display("------------------------------------------------------------------------");
$monitor("time=%d | A=%h | B=%h | C=%h ------->  Sum=%h | Cout=%h", $time,A,B,Cin,Sum,Cout);
$dumpfile("cla.vcd");
$dumpvars();
end

initial begin
A=4'd2; B=4'd12; Cin=1'b0;
#5 A=4'd2; B=4'd12; Cin=1'b1;

$display("--------------------------------------------------------------------------------");

#5 A=4'd10; B=4'd13; Cin=1'b0;
#5 A=4'd10; B=4'd13; Cin=1'b1;
$display("--------------------------------------------------------------------------------");

#5 A=4'd6; B=4'd4; Cin=1'b0;
#5 A=4'd6; B=4'd4; Cin=1'b1;
$display("--------------------------------------------------------------------------------");

#5 A=4'd12; B=4'd11; Cin=1'b0;
#5 A=4'd12; B=4'd11; Cin=1'b1;

	
$display("--------------------------------------------------------------------------------");
	#10 $finish;

$display("");
$display("********************* Verification Finished ***************************");

end
endmodule

