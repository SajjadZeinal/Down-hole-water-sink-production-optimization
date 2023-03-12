Gen_Numbers=(Population_number-1)*VariableNumber;
Mutationrate=0.6;
Mutation_number=round(Mutationrate*Gen_Numbers);
while (1)
    Fitness_Muted=Fitness(2:Population_number,:)';
for ii=1:Mutation_number
    Muted_Choromosome(ii) = round((Gen_Numbers-1)*rand()+1);
    Variable_Selection = rem(Muted_Choromosome(ii),4);
    if Variable_Selection == 1
        Fitness_Muted(Muted_Choromosome(ii)) = (WATER_LIQUID_rate_Bound(2)-WATER_LIQUID_rate_Bound(1))*rand()+WATER_LIQUID_rate_Bound(1);
    elseif Variable_Selection == 2
        Fitness_Muted(Muted_Choromosome(ii)) = (OIL_WELL_COMPLETION_Bound(2)-OIL_WELL_COMPLETION_Bound(1))*rand()+OIL_WELL_COMPLETION_Bound(1);
    elseif Variable_Selection == 3
        Fitness_Muted(Muted_Choromosome(ii)) = (DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound(2)-DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound(1))*rand()+DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound(1);
    elseif Variable_Selection == 0
        Fitness_Muted(Muted_Choromosome(ii)) = (WATER_DRAINAGE_WELL_COMPLETION_Bound(2)-WATER_DRAINAGE_WELL_COMPLETION_Bound(1))*rand()+WATER_DRAINAGE_WELL_COMPLETION_Bound(1);
    end
end
Fitness_Muted_2 = Fitness_Muted';
a4=(Fitness_Muted_2(:,4) >= Fitness_Muted_2(:,3));
a5=((Fitness_Muted_2(:,4) +(Fitness_Muted_2(:,4) - Fitness_Muted_2(:,3))+200) <= 15550);
a6=sum(a4)+sum(a5);
if  a6 == 10
    break;
end
end
Fitness(2:Population_number,:) = Fitness_Muted';
Eval_Fitness=Fitness;
for ii = 1:Population_number
    x=[Eval_Fitness(ii,1),Eval_Fitness(ii,2),Eval_Fitness(ii,3),Eval_Fitness(ii,4)];
    Eval_Fitness(ii,5) = NPV_4_var(x); 
end