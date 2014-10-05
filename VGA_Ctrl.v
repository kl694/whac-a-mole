module	VGA_Ctrl	(	//	Host Side
						iRed,
						iGreen,
						iBlue,
						oCurrent_X,
						oCurrent_Y,
						oAddress,
						oRequest,
						//	VGA Side
						oVGA_R,
						oVGA_G,
						oVGA_B,
						oVGA_HS,
						oVGA_VS,
						oVGA_SYNC,
						oVGA_BLANK,
						oVGA_CLOCK,
						//	Control Signal
						iCLK,
						ledout,
						iRST_N,
						Avg_X,
						Avg_Y);
//	Host Side
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;
output		[21:0]	oAddress;
output		[10:0]	oCurrent_X;
output		[10:0]	oCurrent_Y;
output				oRequest;
output      [10:0] Avg_X, Avg_Y;
output  reg [17:0] ledout;
//	VGA Side
output		[9:0]	oVGA_R;
output		[9:0]	oVGA_G;
output		[9:0]	oVGA_B;
output	reg			oVGA_HS;
output	reg			oVGA_VS;
output				oVGA_SYNC;
output				oVGA_BLANK;
output				oVGA_CLOCK;
//	Control Signal
input				iCLK;
input				iRST_N;	
//	Internal Registers
reg			[10:0]	H_Cont;
reg			[10:0]	V_Cont;
////////////////////////////////////////////////////////////
//	Horizontal	Parameter
parameter	H_FRONT	=	16;
parameter	H_SYNC	=	96;
parameter	H_BACK	=	48;
parameter	H_ACT	=	640;
parameter	H_BLANK	=	H_FRONT+H_SYNC+H_BACK;
parameter	H_TOTAL	=	H_FRONT+H_SYNC+H_BACK+H_ACT;
////////////////////////////////////////////////////////////
//	Vertical Parameter
parameter	V_FRONT	=	11;
parameter	V_SYNC	=	2;
parameter	V_BACK	=	31;
parameter	V_ACT	=	480;
parameter	V_BLANK	=	V_FRONT+V_SYNC+V_BACK;
parameter	V_TOTAL	=	V_FRONT+V_SYNC+V_BACK+V_ACT;
////////////////////////////////////////////////////////////
assign	oVGA_SYNC	=	1'b1;			//	This pin is unused.
assign	oVGA_BLANK	=	~((H_Cont<H_BLANK)||(V_Cont<V_BLANK));
assign	oVGA_CLOCK	=	~iCLK;

assign	oAddress	=	oCurrent_Y*H_ACT+oCurrent_X;
assign	oRequest	=	((H_Cont>=H_BLANK && H_Cont<H_TOTAL)	&&
						 (V_Cont>=V_BLANK && V_Cont<V_TOTAL));
assign	oCurrent_X	=	(H_Cont>=H_BLANK)	?	H_Cont-H_BLANK	:	11'h0	;
assign	oCurrent_Y	=	(V_Cont>=V_BLANK)	?	V_Cont-V_BLANK	:	11'h0	;


reg [19:0] pixel_count, last_pixel_count;
reg [10:0] x_center;
reg [9:0] y_center;
reg flag_close;
 
reg	 [9:0]  R;
reg	 [9:0]  G;
reg	 [9:0]  B;
reg  [31:0] Total_X;
reg  [10:0] Max_X, Min_X, Max_Y, Min_Y,Avg_X,Avg_Y, count;
reg  [18:0] cnt;

always @ (posedge iCLK)
begin
	if ((oCurrent_X == 11'd639)&&(oCurrent_Y == 11'd479) )//&& count == 11'd5)
	begin
		if(cnt>= 19'd1000)
		begin
			Avg_X <= (Max_X + Min_X)>>1;
			Avg_Y <= (Max_Y + Min_Y)>>1;
		end
		else
		begin
			Avg_X <= 11'd0;
			Avg_Y <= 11'd0;
		end
		count <= 11'd0;
	end
	else if((oCurrent_X == 11'd639)&&(oCurrent_Y == 11'd479))
	begin
		count <= count +11'd1;
	end

end
//assign ledout = Min_X;


always @ (posedge iCLK)
begin
	ledout <= 18'd1;
	if ((oCurrent_X == 11'd10)&&(oCurrent_Y == 11'd10))
	begin
		Max_X <= 11'b0;
		Max_Y <= 11'b0;
		Min_X <= 11'd639;			
		Min_Y <= 11'd479;
		cnt <= 19'b0;
	end
	else if ((iRed == 10'b0) && (iGreen == 10'b0) && (iBlue == 10'b1))
	begin
		cnt <= cnt + 19'b1;
		if ((oCurrent_X > Max_X) && (oCurrent_X < 11'd675))
			Max_X <= oCurrent_X;
		if ((oCurrent_X < Min_X) && (oCurrent_X > 11'd5))
			Min_X <= oCurrent_X;
		if ((oCurrent_Y > Max_Y) && (oCurrent_Y < 11'd475))
			Max_Y <= oCurrent_Y;
		if ((oCurrent_Y < Min_Y) && (oCurrent_Y > 11'd5))
			Min_Y <= oCurrent_Y;
	end
end
  
  assign oVGA_R = ((cnt > 19'd1000) && (oCurrent_X > Avg_X - 10'd3) && (oCurrent_X < Avg_X + 10'd3) && (oCurrent_Y > Avg_Y - 10'd3) && (oCurrent_Y < Avg_Y + 10'd3))?10'b1111111111:iRed;
  assign oVGA_G = ((cnt > 19'd1000) && (oCurrent_X > Avg_X - 10'd3) && (oCurrent_X < Avg_X + 10'd3) && (oCurrent_Y > Avg_Y - 10'd3) && (oCurrent_Y < Avg_Y + 10'd3))?10'b1111111111:iGreen;
  assign oVGA_B = ((cnt > 19'd1000) && (oCurrent_X > Avg_X - 10'd3) && (oCurrent_X < Avg_X + 10'd3) && (oCurrent_Y > Avg_Y - 10'd3) && (oCurrent_Y < Avg_Y + 10'd3))?10'b1111111111:iBlue;

//	Horizontal Generator: Refer to the pixel clock
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		H_Cont		<=	0;
		oVGA_HS		<=	1;
	end
	else
	begin
		if(H_Cont<H_TOTAL)
		H_Cont	<=	H_Cont+1'b1;
		else
		H_Cont	<=	0;
		//	Horizontal Sync
		if(H_Cont==H_FRONT-1)			//	Front porch end
		oVGA_HS	<=	1'b0;
		if(H_Cont==H_FRONT+H_SYNC-1)	//	Sync pulse end
		oVGA_HS	<=	1'b1;
	end
end

//	Vertical Generator: Refer to the horizontal sync
always@(posedge oVGA_HS or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		V_Cont		<=	0;
		oVGA_VS		<=	1;
	end
	else
	begin
		if(V_Cont<V_TOTAL)
		V_Cont	<=	V_Cont+1'b1;
		else
		V_Cont	<=	0;
		//	Vertical Sync
		if(V_Cont==V_FRONT-1)			//	Front porch end
		oVGA_VS	<=	1'b0;
		if(V_Cont==V_FRONT+V_SYNC-1)	//	Sync pulse end
		oVGA_VS	<=	1'b1;
	end
end

endmodule