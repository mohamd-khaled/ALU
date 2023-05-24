module ALU(
input [7:0]A,
input [7:0]B,
input [2:0]OPcode,
input carry_in,
output [7:0] out,
output c_flag,
output carry_out
);
wire [7:0]adder_out;
reg [7:0]reg1;
reg reg3;
assign out=reg1;
assign c_flag=reg3;
 
 
always @ (OPcode or A or B)
begin
	if(OPcode == 3'b000 & carry_in == 0)
	begin
		assign reg1 = adder_out;
		reg3 <= (A > B);
	end
	else if (OPcode == 3'b001 & carry_in == 1)
	begin
		assign reg1 = adder_out;
		reg3 <= (A > B);
	end
	else if (OPcode == 3'b010)
	begin
		reg1  <=  A & B;
		reg3 <= (A > B);
	end
	else if (OPcode == 3'b011)
	begin
		reg1  <=  A | B; 
		reg3 <=  (A > B);
	end
	else if (OPcode == 3'b100)
	begin
		reg1  <=  A ^ B; 
		reg3 <= (A > B);
	end
	else if (OPcode == 3'b101)
	begin
		reg1<=  A > B; 
		reg3 <=  (A > B);
	end
	else if (OPcode == 3'b110)
	begin
		reg1  <=  A << 1; 
		reg3 <=  (A > B);
	end
	else if (OPcode == 3'b111)
	begin
		reg1  <=  B << 1; 
		reg3 <=  (A > B);
	end
	else
	reg1 = 8'bz; 
end

FAS_8bit U1(
	.i_A(A),
	.i_B(B),
	.i_C(carry_in),
	.o_S(adder_out),
	.o_C(carry_out)
	);
	
endmodule