module register_file(
input RESET,
input CLK,
input WE,
input [4:0] WDA,
input [4:0] RDA1,
input [4:0] RDA2,
input [31:0] WD,
output [31:0] RD1,
output [31:0] RD2);

reg [31:0] RAM [0:31];

assign RD1 = RAM[RDA1];
assign RD2 = RAM[RDA2];



integer i;
always @ (posedge CLK or posedge RESET)
begin

	if(RESET) begin 
			for(i = 0; i < 32; i = i + 1) begin
				RAM[i] <= 32'b0;
				end
		end
	else
	if(WE & WDA > 0) begin 
	RAM[WDA] <= WD;
	end
	else
	if(WDA == 0) begin
	RAM[WDA] <= 32'd0;
	end
	
end
		
	
endmodule