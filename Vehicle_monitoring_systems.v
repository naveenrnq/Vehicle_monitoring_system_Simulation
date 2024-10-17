  `timescale 1ns / 1ps
   module FSM_Project(in,light,state,flag);
   output reg flag=0;
   input [3:0]in;
   output reg [4:0]light;
   output reg [3:0]state;
   parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6;
   
   parameter NoUser=4'b0000,Start=4'b0111,StressLevel=4'b0110,
   BloodPressure=4'b0101,Breaks=4'b0100,SeatBelt=4'b0011,UnlockedDoor=4'b0010,
   FuelCheck=4'b0001;

   always@(*)
     begin
           case(state)
               S0 : begin 
                       if(in == {FuelCheck})
                          begin
                             state <= S1; #7;
                             light <= FuelCheck; 
                          end
                       else
                           state <= S0;
                             
                    end 
               S1 : begin 
                       if(in == {UnlockedDoor})
                          begin
                              state<= S2; #7;
                              light<=UnlockedDoor;
                          end
                       else
                           state<=S0;
                          
                     end 
               S2 : begin 
                       if(in  ==  {SeatBelt})
                          begin
                             state<=S3; #7;
                             light<=SeatBelt; 
                           end
                        else 
                           state<=S0;
                           
                     end 
               S3 : begin 
                       if(in  ==  {Breaks})
                         begin
                            state<=S4; #7;
                            light<=Breaks; 
                         end
                       else 
                        state<=S0;   
                        
                       end 
               S4 : begin 
                       if(in == {BloodPressure})
                         begin
                           state<=S5; #7;
                           light<=BloodPressure; 
                         end
                       else 
                         state<=S0;
                         
                    end 
               S5 : begin 
                       if(in == {StressLevel})
                          begin
                            state<=S6; #7;
                            light<=StressLevel; 
                          end
                    else 
                       state<=S0;
                       
                    end 
               S6 : begin
                      flag=1;
                      light<=Start; 
                     
                    end
               default : begin 
                          state<=S0;
                          light<=NoUser;
                         end 
         
         endcase
         
     end
     
endmodule
