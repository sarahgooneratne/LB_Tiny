// alu_tb.v
`timescale 1ns / 1ps

module alu_tb;

    reg  [7:0] A;
    reg  [7:0] B;
    reg  [7:0] op;

    wire [7:0] result;
    wire       Z;
    wire       C;

    alu uut (
        .A(A),
        .B(B),
        .op(op),
        .Y(result),
        .Z(Z),
        .C(C)
    );

    task check;
        input [7:0] test_A;
        input [7:0] test_B;
        input [7:0] test_op;
        input [7:0] expected_result;
        input       expected_Z;
        input       expected_C;
        input [127:0] test_name;
        begin
            A  = test_A;
            B  = test_B;
            op = test_op;
            #10;

            if (result === expected_result &&
                Z      === expected_Z &&
                C      === expected_C) begin
                $display("PASS %-16s A=%02h B=%02h op=%02h result=%02h Z=%b C=%b",
                         test_name, A, B, op, result, Z, C);
            end else begin
                $display("FAIL %-16s A=%02h B=%02h op=%02h result=%02h Z=%b C=%b | expected result=%02h Z=%b C=%b",
                         test_name, A, B, op, result, Z, C,
                         expected_result, expected_Z, expected_C);
            end
        end
    endtask

    initial begin
        $display("Starting ALU tests...");

        // ------------------------------------------------------------
        // Implied group: op[7:4] = 0
        // ------------------------------------------------------------

        // SHL: op = 0x02
        check(8'h01, 8'h00, 8'h02, 8'h02, 1'b0, 1'b0, "SHL 0x01");

        // SHL with carry out
        check(8'h80, 8'h00, 8'h02, 8'h00, 1'b1, 1'b1, "SHL carry");

        // SHR: op = 0x01
        check(8'h02, 8'h00, 8'h01, 8'h01, 1'b0, 1'b0, "SHR 0x02");

        // NOTE: Your current SHR sets C = 0.
        // If you want carry to be shifted-out bit, expected C should be 1 here.
        check(8'h01, 8'h00, 8'h01, 8'h00, 1'b1, 1'b0, "SHR zero");

        // Default implied operation: pass B
        check(8'hAA, 8'h55, 8'h00, 8'h55, 1'b0, 1'b0, "PASS B");

        // PASS B zero
        check(8'hAA, 8'h00, 8'h00, 8'h00, 1'b1, 1'b0, "PASS B zero");

        // ------------------------------------------------------------
        // Primary opcode group
        // ------------------------------------------------------------

        // ADD: op[7:4] = 3
        check(8'h10, 8'h05, 8'h30, 8'h15, 1'b0, 1'b0, "ADD");

        // ADD with carry and zero result
        check(8'hFF, 8'h01, 8'h30, 8'h00, 1'b1, 1'b1, "ADD carry zero");

        // ADD with carry but nonzero result
        check(8'hF0, 8'h20, 8'h30, 8'h10, 1'b0, 1'b1, "ADD carry");

        // NAND: op[7:4] = 4
        check(8'hFF, 8'h0F, 8'h40, 8'hF0, 1'b0, 1'b0, "NAND");

        // NAND zero result
        check(8'hFF, 8'hFF, 8'h40, 8'h00, 1'b1, 1'b0, "NAND zero");

        // Default non-implied operation: pass B
        check(8'h12, 8'h34, 8'hA0, 8'h34, 1'b0, 1'b0, "DEFAULT pass B");

        $display("ALU tests complete.");
        $finish;
    end

endmodule