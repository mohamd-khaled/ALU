module FA (
	input i_A,
	input i_B,
	input i_C,
	output o_S,
	output o_C
);

xor (o_S, i_A, i_B, i_C);

wire AB_carry;
wire AC_carry;
wire CB_carry;
and (AB_carry, i_A, i_B);
and (AC_carry, i_A, i_C);
and (CB_carry, i_B, i_C);
or (o_C, AB_carry, AC_carry, CB_carry);
endmodule