module FA_2bit (
input i_C,
input [1:0] i_A,
input [1:0] i_B,
output o_C,
output [1:0] o_S
);

wire c1;

FA U1(
.i_A(i_A[0]),
.i_B(i_B[0]),
.i_C(i_C),
.o_S(o_S[0]),
.o_C(c1)
);

FA U2(
.i_A(i_A[1]),
.i_B(i_B[1]),
.i_C(c1),
.o_S(o_S[1]),
.o_C(o_C)
);

endmodule