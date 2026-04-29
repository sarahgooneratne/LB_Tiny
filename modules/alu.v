/*
Minimal 8-bit ALU
*/

module alu(
	input wire [7:0] A, 		// Operand A
	input wire [7:0] B,			// Operand B
	input wire [7:0] op,		// Op code
	output reg [7:0] result,
	output reg Z,				// Zero flag
	output reg C 				// Carry flag
);

	localparam SHR = 4'h01,
		SHL = 4'h02,
		ADD = 4'h30,
		NAND = 4'h40;

	always @(*) begin
		
		if (op[7:4] == 8'b0000) begin
			case(op[3:0])
				SHL: begin 
						Y = A << 1;
						C = A[7]; // Carry doubles as shift out
					 end
				SHR: begin 
						Y = A >> 1;
						C = 0;
					 end
				default: begin 
							Y = B;
							C = 0;
						 end
			endcase
		end
		else begin
			case(op[7:4])
				ADD: {C, Y} = A + B;
				NAND: begin 
						 Y = ~(A & B);
						 C = 0;
					  end
				default: begin 
							Y = B; // Operand B (MDR output) is output by default for immediate operations
							C = 0;
						 end
			endcase
		end

		Z = (Y == 0);
	end

endmodule