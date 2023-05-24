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
wire c_in;
reg [7:0]reg1;
reg reg2;
assign out=reg1;
assign c_flag=reg2;
assign c_in=carry_in;
 
 
always @ (OPcode or A or B)
begin
	case(OPcode)
	3'b000: 
	begin 
		if(~c_in)
			begin
				reg1 <= adder_out; 
				reg2 <= (A > B);
			end
		else
			begin
				reg1 = 8'bx;
			end
	end
	3'b001: 
	begin 
		if(c_in)
			begin
				reg1 <= adder_out; 
				reg2 <= (A > B); 
			end
		else
			begin
				reg1 = 8'bx;
			end
	end
	3'b010: begin reg1  <=  A & B; reg2 <= (A > B); end
	3'b011: begin reg1  <=  A | B; reg2 <=  (A > B); end
	3'b100: begin reg1  <=  A ^ B; reg2 <= (A > B); end
	3'b101: begin reg1  <=  A > B; reg2 <=  (A > B); end
	3'b110: begin reg1  <=  A << 1; reg2 <=  (A > B); end
	3'b111: begin reg1  <=  B << 1; reg2 <=  (A > B); end
	default: reg1 = 8'bx;
	endcase	
end

FAS_8bit U1(
	.i_A(A),
	.i_B(B),
	.i_C(carry_in),
	.o_S(adder_out),
	.o_C(carry_out)
	);
	
endmodule