function [ BLOCK_WOC_DIS , N_WOC_DIS  ] = DZ_EDIT( x4 , x3 )
%DZ edit
% Distance between WOC and top water drainage Completion
for ii=0:23
WOC_DIS = x4-x3;
if WOC_DIS == 0
    BLOCK_WOC_DIS=0;
    N_WOC_DIS = 0;
else if WOC_DIS <= (ii+1)*20 && WOC_DIS > ii*20
        BLOCK_WOC_DIS=WOC_DIS/((ii+1)*4);
        N_WOC_DIS=(ii+1)*4; 
    end
end
end

end

