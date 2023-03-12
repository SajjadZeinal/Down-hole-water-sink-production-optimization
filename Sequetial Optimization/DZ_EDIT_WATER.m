function [ BLOCK_WATER , N_WATER   ] = DZ_EDIT_WATER( x4 , x3 )
%DZ edit
% Distance between WOC and top water drainage Completion
 WATER_LENGTH = x4-x3; 
if WATER_LENGTH == 0 
   x4 = x3 + 1;
   BLOCK_WATER=1;
   N_WATER=1;
else
   for ii=0:99
       if WATER_LENGTH <= (ii+1)*5 && WATER_LENGTH > ii*5
        BLOCK_WATER=WATER_LENGTH/(ii+1);
        N_WATER=(ii+1); 
       end
   end
end
end
   
%{   
elseif WATER_LENGTH <=5 && WATER_LENGTH ~= 0  
    BLOCK_WATER=WATER_LENGTH;
    N_WATER=1;

elseif WATER_LENGTH <= 10 && WATER_LENGTH > 5
     BLOCK_WATER=WATER_LENGTH/2;
     N_WATER=2;

elseif WATER_LENGTH <= 15 && WATER_LENGTH > 10
     BLOCK_WATER=WATER_LENGTH/3;
     N_WATER=3;

elseif WATER_LENGTH <= 20 && WATER_LENGTH > 15
     BLOCK_WATER=WATER_LENGTH/4;
     N_WATER=4;
     
elseif WATER_LENGTH <= 25 && WATER_LENGTH > 20
     BLOCK_WATER=WATER_LENGTH/5;
     N_WATER=5;
     
     elseif WATER_LENGTH <= 30 && WATER_LENGTH > 25
     BLOCK_WATER=WATER_LENGTH/6;
     N_WATER=6;
     
     elseif WATER_LENGTH <= 35 && WATER_LENGTH > 30
     BLOCK_WATER=WATER_LENGTH/7;
     N_WATER=7;
     
     elseif WATER_LENGTH <= 40 && WATER_LENGTH > 35
     BLOCK_WATER=WATER_LENGTH/8;
     N_WATER=8;
     
     elseif WATER_LENGTH <= 45 && WATER_LENGTH > 40
     BLOCK_WATER=WATER_LENGTH/9;
     N_WATER=9;
     
     elseif WATER_LENGTH <= 50 && WATER_LENGTH > 45
     BLOCK_WATER=WATER_LENGTH/10;
     N_WATER=10;
     
     elseif WATER_LENGTH <= 55 && WATER_LENGTH > 50
     BLOCK_WATER=WATER_LENGTH/11;
     N_WATER=11;
     
     elseif WATER_LENGTH <= 60 && WATER_LENGTH > 55
     BLOCK_WATER=WATER_LENGTH/12;
     N_WATER=12;
     
     elseif WATER_LENGTH <= 65 && WATER_LENGTH > 60
     BLOCK_WATER=WATER_LENGTH/13;
     N_WATER=13;
     
     elseif WATER_LENGTH <= 70 && WATER_LENGTH > 65
     BLOCK_WATER=WATER_LENGTH/14;
     N_WATER=14;
     
     elseif WATER_LENGTH <= 75 && WATER_LENGTH > 70
     BLOCK_WATER=WATER_LENGTH/15;
     N_WATER=15;
     
     elseif WATER_LENGTH <= 80 && WATER_LENGTH > 75
     BLOCK_WATER=WATER_LENGTH/16;
     N_WATER=16;
     
     elseif WATER_LENGTH <= 85 && WATER_LENGTH > 80
     BLOCK_WATER=WATER_LENGTH/17;
     N_WATER=17;
     
     elseif WATER_LENGTH <= 90 && WATER_LENGTH > 85
     BLOCK_WATER=WATER_LENGTH/18;
     N_WATER=18;
     
     elseif WATER_LENGTH <= 95 && WATER_LENGTH > 90
     BLOCK_WATER=WATER_LENGTH/19;
     N_WATER=19;
     
     elseif WATER_LENGTH <= 100 && WATER_LENGTH > 95
     BLOCK_WATER=WATER_LENGTH/20;
     N_WATER=20;
     
     elseif WATER_LENGTH <= 105 && WATER_LENGTH > 100
     BLOCK_WATER=WATER_LENGTH/21;
     N_WATER=21;
     
     elseif WATER_LENGTH <= 110 && WATER_LENGTH > 105
     BLOCK_WATER=WATER_LENGTH/22;
     N_WATER=22;
     
     elseif WATER_LENGTH <= 115 && WATER_LENGTH > 110
     BLOCK_WATER=WATER_LENGTH/23;
     N_WATER=23;
     
     elseif WATER_LENGTH <= 120 && WATER_LENGTH > 115
     BLOCK_WATER=WATER_LENGTH/24;
     N_WATER=24;
     
     elseif WATER_LENGTH <= 125 && WATER_LENGTH > 120
     BLOCK_WATER=WATER_LENGTH/25;
     N_WATER=25;
     
     elseif WATER_LENGTH <= 130 && WATER_LENGTH > 125
     BLOCK_WATER=WATER_LENGTH/26;
     N_WATER=26;
     
     elseif WATER_LENGTH <= 135 && WATER_LENGTH > 130
     BLOCK_WATER=WATER_LENGTH/27;
     N_WATER=27;
     
     elseif WATER_LENGTH <= 140 && WATER_LENGTH > 135
     BLOCK_WATER=WATER_LENGTH/28;
     N_WATER=28;
     
     elseif WATER_LENGTH <= 145 && WATER_LENGTH > 140
     BLOCK_WATER=WATER_LENGTH/29;
     N_WATER=29;
     
     elseif WATER_LENGTH <= 150 && WATER_LENGTH > 145
     BLOCK_WATER=WATER_LENGTH/30;
     N_WATER=30;
     
     elseif WATER_LENGTH <= 155 && WATER_LENGTH > 150
     BLOCK_WATER=WATER_LENGTH/31;
     N_WATER=31;
     
     elseif WATER_LENGTH <= 160 && WATER_LENGTH > 155
     BLOCK_WATER=WATER_LENGTH/32;
     N_WATER=32;
     
     elseif WATER_LENGTH <= 165 && WATER_LENGTH > 160
     BLOCK_WATER=WATER_LENGTH/33;
     N_WATER=33;
     
     elseif WATER_LENGTH <= 170 && WATER_LENGTH > 165
     BLOCK_WATER=WATER_LENGTH/34;
     N_WATER=34;
     
     elseif WATER_LENGTH <= 175 && WATER_LENGTH > 170
     BLOCK_WATER=WATER_LENGTH/35;
     N_WATER=35;
     
     elseif WATER_LENGTH <= 180 && WATER_LENGTH > 175
     BLOCK_WATER=WATER_LENGTH/36;
     N_WATER=36;
     
     elseif WATER_LENGTH <= 185 && WATER_LENGTH > 180
     BLOCK_WATER=WATER_LENGTH/37;
     N_WATER=37;
     
     elseif WATER_LENGTH <= 190 && WATER_LENGTH > 185
     BLOCK_WATER=WATER_LENGTH/38;
     N_WATER=38;
     
     elseif WATER_LENGTH <= 195 && WATER_LENGTH > 190
     BLOCK_WATER=WATER_LENGTH/39;
     N_WATER=39;
     
     elseif WATER_LENGTH <= 200 && WATER_LENGTH > 195
     BLOCK_WATER=WATER_LENGTH/40;
     N_WATER=40;
     
     elseif WATER_LENGTH <= 205 && WATER_LENGTH > 200
     BLOCK_WATER=WATER_LENGTH/41;
     N_WATER=41;
     
      elseif WATER_LENGTH <= 210 && WATER_LENGTH > 205
     BLOCK_WATER=WATER_LENGTH/42;
     N_WATER=42;
     
      elseif WATER_LENGTH <= 215 && WATER_LENGTH > 210
     BLOCK_WATER=WATER_LENGTH/43;
     N_WATER=43;
     
     elseif WATER_LENGTH <= 220 && WATER_LENGTH > 215
     BLOCK_WATER=WATER_LENGTH/44;
     N_WATER=44;
     
     elseif WATER_LENGTH <= 225 && WATER_LENGTH > 220
     BLOCK_WATER=WATER_LENGTH/45;
     N_WATER=45;
     
     elseif WATER_LENGTH <= 230 && WATER_LENGTH > 225
     BLOCK_WATER=WATER_LENGTH/46;
     N_WATER=46;
     
     elseif WATER_LENGTH <= 235 && WATER_LENGTH > 230
     BLOCK_WATER=WATER_LENGTH/47;
     N_WATER=47;
     
     elseif WATER_LENGTH <= 240 && WATER_LENGTH > 235
     BLOCK_WATER=WATER_LENGTH/48;
     N_WATER=48;
     
     elseif WATER_LENGTH <= 245 && WATER_LENGTH > 240
     BLOCK_WATER=WATER_LENGTH/49;
     N_WATER=49;
     
     elseif WATER_LENGTH <= 250 && WATER_LENGTH > 245
     BLOCK_WATER=WATER_LENGTH/50;
     N_WATER=50;
     
     elseif WATER_LENGTH <= 255 && WATER_LENGTH > 250
     BLOCK_WATER=WATER_LENGTH/51;
     N_WATER=51;
     
     elseif WATER_LENGTH <= 260 && WATER_LENGTH > 255
     BLOCK_WATER=WATER_LENGTH/52;
     N_WATER=52;
     
     elseif WATER_LENGTH <= 265 && WATER_LENGTH > 260
     BLOCK_WATER=WATER_LENGTH/53;
     N_WATER=53;
     
     elseif WATER_LENGTH <= 270 && WATER_LENGTH > 265
     BLOCK_WATER=WATER_LENGTH/54;
     N_WATER=54;
     
     elseif WATER_LENGTH <= 275 && WATER_LENGTH > 270
     BLOCK_WATER=WATER_LENGTH/55;
     N_WATER=55;
     
     elseif WATER_LENGTH <= 280 && WATER_LENGTH > 275
     BLOCK_WATER=WATER_LENGTH/56;
     N_WATER=56;
     
     elseif WATER_LENGTH <= 285 && WATER_LENGTH > 280
     BLOCK_WATER=WATER_LENGTH/57;
     N_WATER=57;
     
     elseif WATER_LENGTH <= 290 && WATER_LENGTH > 285
     BLOCK_WATER=WATER_LENGTH/58;
     N_WATER=58;
     
     elseif WATER_LENGTH <= 295 && WATER_LENGTH > 290
     BLOCK_WATER=WATER_LENGTH/59;
     N_WATER=59;
     
     elseif WATER_LENGTH <= 300 && WATER_LENGTH > 295
     BLOCK_WATER=WATER_LENGTH/60;
     N_WATER=60;
     
     
     
end
%}


