global attempt attempt2 NPV_MATRIX  
VariableNumber=4;
Population_number=6;
WATER_LIQUID_rate_Bound=[100,3800];
OIL_WELL_COMPLETION_Bound=[15000,15050];
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound=[15050,15549];
WATER_DRAINAGE_WELL_COMPLETION_Bound=[15050,15550];
%WATER_DRAINAGE_WELL_COMPLETION_Bound - DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound <=145
Fitness=zeros(Population_number,VariableNumber+1);
Probability=zeros(Population_number,1);
Obj_cumulative_Probability=zeros(Population_number,1);
random_selection=zeros(Population_number,1);
NewChoromosome=zeros(Population_number,VariableNumber+1);
random_Crossover=zeros(Population_number,1);
%Initialization
attempt=1;
attempt2=1;
%{
WATER_LIQUID_rate=2000;
OIL_WELL_COMPLETION=15020;
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC=15090;
WATER_DRAINAGE_WELL_COMPLETION=15100;
Fitness(1,1)=WATER_LIQUID_rate;
Fitness(1,2)=OIL_WELL_COMPLETION;
Fitness(1,3)=DISTANCE_TOP_WATER_DRAINAGE_TO_WOC;
Fitness(1,4)=WATER_DRAINAGE_WELL_COMPLETION;
x=[WATER_LIQUID_rate , OIL_WELL_COMPLETION , DISTANCE_TOP_WATER_DRAINAGE_TO_WOC , WATER_DRAINAGE_WELL_COMPLETION  ];
%}
Initial_Population= [3500	15020	15050	    15100
                     3427.824726	15046.21428	15111.13367 	15223.45493
                     2500	        15025.83524	15064.89962	    15167.78268
                     3427.824726	15048.1834	15053.49986     15197.19503
                     657.6656858	15019.23805	15053.49986     15167.78268
                     2294.816737	15010.465	15116.0632	    15223.45493
];

for ii =1:Population_number
Fitness(ii,1)=Initial_Population(ii,1);
Fitness(ii,2)=Initial_Population(ii,2);
Fitness(ii,3)=Initial_Population(ii,3);
Fitness(ii,4)=Initial_Population(ii,4);
x=[Initial_Population(ii,1) , Initial_Population(ii,2) , Initial_Population(ii,3) , Initial_Population(ii,4)  ];
Fitness(ii,5)=NPV_4_var(x);
end
Best_Fitness(attempt,1)=max(Fitness(:,5));
Ave_Fitness(attempt,1)=mean(Fitness(:,5));
generation(Population_number*(attempt-1)+1:Population_number*attempt,:)=Fitness;
plot(attempt,Best_Fitness(attempt,1),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,1),'k.','markersize',5);
hold on;
title('NPV_Optimization (LRATW,LRATO)');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
attempt=attempt+1;
% Stopping Criteria
max_iteration = 60;
Tol_Fitness=100;
while 1
% Sorting
sorted_NPV=sort(Fitness(:,5),'descend');
for ii = 1:Population_number
    for jj = 1:Population_number
    if sorted_NPV(ii) == Fitness(jj,5)
        sorted_Fitness(ii,:) = Fitness(jj,:); 
    end
    end
end
Fitness=sorted_Fitness;
Fitness(Population_number,:)=Fitness(1,:);
    
% Selection (Roulette Wheel)
total=sum(Fitness(1:Population_number,5));
cumulative_Probability=0;
for ii=1:Population_number
   Probability(ii)=Fitness(ii,5)/total;
   cumulative_Probability=cumulative_Probability+Probability(ii);
   Obj_cumulative_Probability(ii)=cumulative_Probability;
   random_selection(ii)=rand();
end
random_selection(1)=-1;
for ii=1:Population_number
    for jj=1:Population_number-1
    if random_selection(ii) > Obj_cumulative_Probability(jj) && random_selection(ii) <= Obj_cumulative_Probability(jj+1)
        NewChoromosome(ii,:) = Fitness(jj+1,1:VariableNumber+1);
    elseif random_selection(ii) < Obj_cumulative_Probability(1)
         NewChoromosome(ii,:) = Fitness(1,1:VariableNumber+1);
    end
    end
end
Fitness=NewChoromosome;

    % Sorting Selected
sorted_NPV=sort(Fitness(:,5),'descend');
for ii = 1:Population_number
    for jj = 1:Population_number
    if sorted_NPV(ii) == Fitness(jj,5)
        sorted_Fitness(ii,:) = Fitness(jj,:); 
    end
    end
end
Fitness=sorted_Fitness(:,1:VariableNumber);
% Crossover
Crossover_rate=0.4;
while (1)
    temp=1;
    Fitness_Crossed=Fitness;
    Cross_Assistant=Fitness_Crossed;
for ii=1:Population_number
    random_Crossover(ii)=rand();
    if random_Crossover(ii) < Crossover_rate
        CrossoverChoromosome(temp) = ii;
        temp=temp+1;
    end
end
cross_count=Population_number;
if temp > 2
for ii=1:length(CrossoverChoromosome)-1
    Crossover_Point = round((VariableNumber - 2)*rand()+1);
    %if ii == length(CrossoverChoromosome)
    %   Fitness_Crossed(CrossoverChoromosome(ii),:) = [Fitness_Crossed(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber-1)];
    %else
       Cross_Assistant(cross_count,:) = [Fitness_Crossed(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness_Crossed(CrossoverChoromosome(ii+1),Crossover_Point+1:VariableNumber)];
       cross_count=cross_count-1;
end
a1=(Fitness_Crossed(:,4) >= Fitness_Crossed(:,3));
%a2=((Fitness_Crossed(:,4) +(Fitness_Crossed(:,4) - Fitness_Crossed(:,3))+200) <= 15550);
a3=sum(a1);
if a3 == 6
    Fitness=Cross_Assistant;
    %for ii=1:length(CrossoverChoromosome)
    %Fitness(CrossoverChoromosome(ii),:)=Fitness_Crossed(CrossoverChoromosome(ii),:);
    %end
    clear CrossoverChoromosome; 
    break;
end
else 
    clear CrossoverChoromosome; 
    break;
end
clear CrossoverChoromosome; 
end
% Mutation
Gen_Numbers=(Population_number-1)*VariableNumber;
Mutationrate=0.2;
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
%a5=((Fitness_Muted_2(:,4) +(Fitness_Muted_2(:,4) - Fitness_Muted_2(:,3))+200) <= 15550);
a6=sum(a4);
if  a6 == 5
    Fitness(2:Population_number,:) = Fitness_Muted';
    clear Fitness_Muted Muted_Choromosome
    break;
end
clear Fitness_Muted Muted_Choromosome
end
Eval_Fitness=Fitness;
for ii = 1:Population_number
    x=[Eval_Fitness(ii,1),Eval_Fitness(ii,2),Eval_Fitness(ii,3),Eval_Fitness(ii,4)];
    Eval_Fitness(ii,5) = NPV_4_var(x); 
end
Fitness=Eval_Fitness;
generation(Population_number*(attempt-1)+1:Population_number*attempt,:)=Eval_Fitness;
Best_Fitness(attempt,1)=max(Fitness(:,5));
Ave_Fitness(attempt,1)=mean(Fitness(:,5));
plot(attempt,Best_Fitness(attempt,1),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,1),'k.','markersize',5);
hold on;
title('NPV_Optimization (LRATW,LRATO)');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
if attempt == 50
       stop_criteria = Best_Fitness(attempt,1);
end
    if attempt == max_iteration
    tolerance = abs(stop_criteria - Best_Fitness(length(Best_Fitness)-10:length(Best_Fitness)));
    Tol_Fitness=sum(tolerance);
    if Tol_Fitness < 1E-3
        break;
    else
        max_iteration=max_iteration+5;
        stop_criteria=Best_Fitness(max_iteration-5,1);
    end
    end
attempt=attempt+1;
fclose all;
end