function [ BLOCK_DIST , N_DIST  ] = DZ_EDIT_DIST_WOC( x4 , x3 )
%DZ edit
% Distance between WOC and top water drainage Completion
%{
 DIST_LENGTH = x4-x3; 
if DIST_LENGTH == 0 
   BLOCK_DIST=0;
   N_DIST=0;
 
else
%}
DIST_LENGTH = x4-x3;
if DIST_LENGTH == 0
    BLOCK_DIST=0;
    N_DIST = 0;
else
   for ii=0:99

       if DIST_LENGTH <= (ii+1)*5 && DIST_LENGTH > ii*5
        BLOCK_DIST=DIST_LENGTH/(ii+1);
        N_DIST=(ii+1); 
       end
   end
end
   end  
 %{  
elseif DIST_LENGTH <=5 && DIST_LENGTH ~= 0  
    BLOCK_DIST= DIST_LENGTH;
    N_DIST=1;

elseif DIST_LENGTH <= 10 && DIST_LENGTH > 5
     BLOCK_DIST=DIST_LENGTH/2;
     N_DIST=2;

elseif DIST_LENGTH <= 15 && DIST_LENGTH > 10
     BLOCK_DIST=DIST_LENGTH/3;
     N_DIST=3;

elseif DIST_LENGTH <= 20 && DIST_LENGTH > 15
     BLOCK_DIST=DIST_LENGTH/4;
     N_DIST=4;
     
elseif DIST_LENGTH <= 25 && DIST_LENGTH > 20
     BLOCK_DIST=DIST_LENGTH/5;
     N_DIST=5;
     
     elseif DIST_LENGTH <= 30 && DIST_LENGTH > 25
     BLOCK_DIST=DIST_LENGTH/6;
     N_DIST=6;
     
     elseif DIST_LENGTH <= 35 && DIST_LENGTH > 30
     BLOCK_DIST=DIST_LENGTH/7;
     N_DIST=7;
     
     elseif DIST_LENGTH <= 40 && DIST_LENGTH > 35
     BLOCK_DIST=DIST_LENGTH/8;
     N_DIST=8;
     
     elseif DIST_LENGTH <= 45 && DIST_LENGTH > 40
     BLOCK_DIST=DIST_LENGTH/9;
     N_DIST=9;
     
     elseif DIST_LENGTH <= 50 && DIST_LENGTH > 45
     BLOCK_DIST=DIST_LENGTH/10;
     N_DIST=10;
     
     elseif DIST_LENGTH <= 55 && DIST_LENGTH > 50
     BLOCK_DIST=DIST_LENGTH/11;
     N_DIST=11;
     
     elseif DIST_LENGTH <= 60 && DIST_LENGTH > 55
     BLOCK_DIST=DIST_LENGTH/12;
     N_DIST=12;
     
     elseif DIST_LENGTH <= 65 && DIST_LENGTH > 60
     BLOCK_DIST=DIST_LENGTH/13;
     N_DIST=13;
     
     elseif DIST_LENGTH <= 70 && DIST_LENGTH > 65
     BLOCK_DIST=DIST_LENGTH/14;
     N_DIST=14;
     
     elseif DIST_LENGTH <= 75 && DIST_LENGTH > 70
     BLOCK_DIST=DIST_LENGTH/15;
     N_DIST=15;
     
     elseif DIST_LENGTH <= 80 && DIST_LENGTH > 75
     BLOCK_DIST=DIST_LENGTH/16;
     N_DIST=16;
     
     elseif DIST_LENGTH <= 85 && DIST_LENGTH > 80
     BLOCK_DIST=DIST_LENGTH/17;
     N_DIST=17;
     
     elseif DIST_LENGTH <= 90 && DIST_LENGTH > 85
     BLOCK_DIST=DIST_LENGTH/18;
     N_DIST=18;
     
     elseif DIST_LENGTH <= 95 && DIST_LENGTH > 90
     BLOCK_DIST=DIST_LENGTH/19;
     N_DIST=19;
     
     elseif DIST_LENGTH <= 100 && DIST_LENGTH > 95
     BLOCK_DIST=DIST_LENGTH/20;
     N_DIST=20;
     
     elseif DIST_LENGTH <= 105 && DIST_LENGTH > 100
     BLOCK_DIST=DIST_LENGTH/21;
     N_DIST=21;
     
     elseif DIST_LENGTH <= 110 && DIST_LENGTH > 105
     BLOCK_DIST=DIST_LENGTH/22;
     N_DIST=22;
     
     elseif DIST_LENGTH <= 115 && DIST_LENGTH > 110
     BLOCK_DIST=DIST_LENGTH/23;
     N_DIST=23;
     
     elseif DIST_LENGTH <= 120 && DIST_LENGTH > 115
     BLOCK_DIST=DIST_LENGTH/24;
     N_DIST=24;
     
     elseif DIST_LENGTH <= 125 && DIST_LENGTH > 120
     BLOCK_DIST=DIST_LENGTH/25;
     N_DIST=25;
     
     elseif DIST_LENGTH <= 130 && DIST_LENGTH > 125
     BLOCK_DIST=DIST_LENGTH/26;
     N_DIST=26;
     
     elseif DIST_LENGTH <= 135 && DIST_LENGTH > 130
     BLOCK_DIST=DIST_LENGTH/27;
     N_DIST=27;
     
     elseif DIST_LENGTH <= 140 && DIST_LENGTH > 135
     BLOCK_DIST=DIST_LENGTH/28;
     N_DIST=28;
     
     elseif DIST_LENGTH <= 145 && DIST_LENGTH > 140
     BLOCK_DIST=DIST_LENGTH/29;
     N_DIST=29;
     
     elseif DIST_LENGTH <= 150 && DIST_LENGTH > 145
     BLOCK_DIST=DIST_LENGTH/30;
     N_DIST=30;
     
     elseif DIST_LENGTH <= 155 && DIST_LENGTH > 150
     BLOCK_DIST=DIST_LENGTH/31;
     N_DIST=31;
     
     elseif DIST_LENGTH <= 160 && DIST_LENGTH > 155
     BLOCK_DIST=DIST_LENGTH/32;
     N_DIST=32;
     
     elseif DIST_LENGTH <= 165 && DIST_LENGTH > 160
     BLOCK_DIST=DIST_LENGTH/33;
     N_DIST=33;
     
     elseif DIST_LENGTH <= 170 && DIST_LENGTH > 165
     BLOCK_DIST=DIST_LENGTH/34;
     N_DIST=34;
     
     elseif DIST_LENGTH <= 175 && DIST_LENGTH > 170
     BLOCK_DIST=DIST_LENGTH/35;
     N_DIST=35;
     
     elseif DIST_LENGTH <= 180 && DIST_LENGTH > 175
     BLOCK_DIST=DIST_LENGTH/36;
     N_DIST=36;
     
     elseif DIST_LENGTH <= 185 && DIST_LENGTH > 180
     BLOCK_DIST=DIST_LENGTH/37;
     N_DIST=37;
     
     elseif DIST_LENGTH <= 190 && DIST_LENGTH > 185
     BLOCK_DIST=DIST_LENGTH/38;
     N_DIST=38;
     
     elseif DIST_LENGTH <= 195 && DIST_LENGTH > 190
     BLOCK_DIST=DIST_LENGTH/39;
     N_DIST=39;
     
     elseif DIST_LENGTH <= 200 && DIST_LENGTH > 195
     BLOCK_DIST=DIST_LENGTH/40;
     N_DIST=40;
     
     elseif DIST_LENGTH <= 205 && DIST_LENGTH > 200
     BLOCK_DIST=DIST_LENGTH/41;
     N_DIST=41;
     
      elseif DIST_LENGTH <= 210 && DIST_LENGTH > 205
     BLOCK_DIST=DIST_LENGTH/42;
     N_DIST=42;
     
      elseif DIST_LENGTH <= 215 && DIST_LENGTH > 210
     BLOCK_DIST=DIST_LENGTH/43;
     N_DIST=43;
     
     elseif DIST_LENGTH <= 220 && DIST_LENGTH > 215
     BLOCK_DIST=DIST_LENGTH/44;
     N_DIST=44;
     
     elseif DIST_LENGTH <= 225 && DIST_LENGTH > 220
     BLOCK_DIST=DIST_LENGTH/45;
     N_DIST=45;
     
     elseif DIST_LENGTH <= 230 && DIST_LENGTH > 225
     BLOCK_DIST=DIST_LENGTH/46;
     N_DIST=46;
     
     elseif DIST_LENGTH <= 235 && DIST_LENGTH > 230
     BLOCK_DIST=DIST_LENGTH/47;
     N_DIST=47;
     
     elseif DIST_LENGTH <= 240 && DIST_LENGTH > 235
     BLOCK_DIST=DIST_LENGTH/48;
     N_DIST=48;
     
     elseif DIST_LENGTH <= 245 && DIST_LENGTH > 240
     BLOCK_DIST=DIST_LENGTH/49;
     N_DIST=49;
     
     elseif DIST_LENGTH <= 250 && DIST_LENGTH > 245
     BLOCK_DIST=DIST_LENGTH/50;
     N_DIST=50;
     
     elseif DIST_LENGTH <= 255 && DIST_LENGTH > 250
     BLOCK_DIST=DIST_LENGTH/51;
     N_DIST=51;
     
     elseif DIST_LENGTH <= 260 && DIST_LENGTH > 255
     BLOCK_DIST=DIST_LENGTH/52;
     N_DIST=52;
     
     elseif DIST_LENGTH <= 265 && DIST_LENGTH > 260
     BLOCK_DIST=DIST_LENGTH/53;
     N_DIST=53;
     
     elseif DIST_LENGTH <= 270 && DIST_LENGTH > 265
     BLOCK_DIST=DIST_LENGTH/54;
     N_DIST=54;
     
     elseif DIST_LENGTH <= 275 && DIST_LENGTH > 270
     BLOCK_DIST=DIST_LENGTH/55;
     N_DIST=55;
     
     elseif DIST_LENGTH <= 280 && DIST_LENGTH > 275
     BLOCK_DIST=DIST_LENGTH/56;
     N_DIST=56;
     
     elseif DIST_LENGTH <= 285 && DIST_LENGTH > 280
     BLOCK_DIST=DIST_LENGTH/57;
     N_DIST=57;
     
     elseif DIST_LENGTH <= 290 && DIST_LENGTH > 285
     BLOCK_DIST=DIST_LENGTH/58;
     N_DIST=58;
     
     elseif DIST_LENGTH <= 295 && DIST_LENGTH > 290
     BLOCK_DIST=DIST_LENGTH/59;
     N_DIST=59;
     
     elseif DIST_LENGTH <= 300 && DIST_LENGTH > 295
     BLOCK_DIST=DIST_LENGTH/60;
     N_DIST=60;
     
     
end
%}

