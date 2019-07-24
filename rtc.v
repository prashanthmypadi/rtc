module rtc(clk);
   input clk;
   reg [5:0] sec;
   reg [5:0] minute;
   reg [4:0] hour;
   reg [4:0] date;
   reg [3:0] month;
   reg [14:0] clk_div=15'b0;
   always @ (posedge (clk))
     clk_div <= clk_div+1;
   always @ (posedge (clk_div[14]))
     begin
	sec<=sec+1;
	if(sec==6'h3b)
	  begin
	     sec<=6'b0;
	     minute<=minute+1;
	     if(minute==6'h3b)
	       begin
		  minute<=6'b0;
		  hour<=hour+1;
		  if(hour==5'h17)
		    begin
		       hour<=5'b0;
		       date<=date+1;
		    end
	       end
	  end // if (sec==6'h3b)
     end // always @ (posedge (clk_div[15]))
endmodule // rtc


