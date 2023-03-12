function [ BLOCK_BELOW_WATER_LENGTH , N_BELOW_WATER ] = DZ_EDIT_BELOW_WATER_DRAINAGE( x1 , x2)

BELOW_WATER_LENGTH = x1-x2;
if BELOW_WATER_LENGTH <= 5 && BELOW_WATER_LENGTH ~= 0
   BLOCK_BELOW_WATER_LENGTH = BELOW_WATER_LENGTH;
   N_BELOW_WATER = 1;
else
    for ii = 1:99
        temp = 5*ii;
    if BELOW_WATER_LENGTH <= temp+5 && BELOW_WATER_LENGTH > temp
       BLOCK_BELOW_WATER_LENGTH = BELOW_WATER_LENGTH/(ii+1);
       N_BELOW_WATER = ii+1; 
    end
    end
end
end

