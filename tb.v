module tb();
	reg clk;
	rtc r(clk);
	initial begin
		$dumpfile("rtc.vcd");
		$dumpvars(0,r.clk,r.sec,r.minute,r.hour,r.date);
		clk = 1'b0;
		r.sec=6'd59;
		r.minute=6'd59;
		r.hour=5'd23;
		r.date=5'b0;
		r.month=4'b0;
		#6553500 $finish;
	end
	always #1 clk = ~clk;
endmodule