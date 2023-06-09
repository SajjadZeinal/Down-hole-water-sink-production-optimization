global attempt attempt2 NPV_MATRIX FineMode
FineMode=0;
Fine_Count=0;
xlrange=['A1:D1  ';'A2:D2  ';'A3:D3  ';'A4:D4  ';'A5:D5  ';'A6:D6  ';'A7:D7  ';'A8:D8  ';'A9:D9  ';'A10:D10';'A11:D11';'A12:D12';'A13:D13';'A14:D14'];
VariableNumber=4;
Population_number=3;
Optimization_count=1;
generation=zeros(1000,1000);
generation_Water=zeros(1000,1000);
Best_Fitness_Water=zeros(1000,1000);
Ave_Fitness_Water=zeros(1000,1000);
Best_Fitness=zeros(1000,1000);
Ave_Fitness=zeros(1000,1000);
total_Optimization_number=1;
WATER_LIQUID_rate_Bound=[100,3800];
OIL_WELL_COMPLETION_Bound=[15000,15050];
DISTANCE_TOP_WATER_DRAINAGE_TO_WOC_Bound=[15050,15549];
WATER_DRAINAGE_WELL_COMPLETION_Bound=[15050,15550];
Fitness=zeros(Population_number,VariableNumber+1);
Probability=zeros(Population_number,1);
Obj_cumulative_Probability=zeros(Population_number,1);
random_selection=zeros(Population_number,1);
NewChoromosome=zeros(Population_number,VariableNumber+1);
random_Crossover=zeros(Population_number,1);
Initial_Population= [3500	            15020	    15050	        15100
                     3500	            15046.21428	15111.13367 	15223.45493
                     3500	            15025.83524	15064.89962	    15167.78268
];


while 1
    % Opening Optimization

attempt=1;
attempt2=1;
if total_Optimization_number == 1
    for ii=1:Population_number
        Fitness(ii,1:4)=Initial_Population(ii,1:4);
        x= Initial_Population(ii,1:4);
        Fitness(ii,5)=NPV_4_var(x);
    end
else 
    x=[WATER_LIQUID_rate , OIL_WELL_COMPLETION , DISTANCE_TOP_WATER_DRAINAGE_TO_WOC , WATER_DRAINAGE_WELL_COMPLETION  ];
    Fitness(1,1:4)=x;
    Fitness(1,5)=NPV_4_var(x);
    for ii=2:Population_number
        Fitness(ii,1)=WATER_LIQUID_rate;
        Fitness(ii,2:4)=Initial_Population(ii,2:4);
        x= Fitness(ii,1:4);
        Fitness(ii,5)=NPV_4_var(x);
    end
end 
Best_Fitness(attempt,total_Optimization_number)=max(Fitness(:,5));
Ave_Fitness(attempt,total_Optimization_number)=mean(Fitness(:,5));
generation(Population_number*(attempt-1)+1:Population_number*attempt,(total_Optimization_number-1)*5+1:(total_Optimization_number)*5)=Fitness;
plot(attempt,Best_Fitness(attempt,total_Optimization_number),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,total_Optimization_number),'k.','markersize',5);
hold on;
title('NPV_Optimization_Openings ');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
attempt=attempt+1;
% Stopping Criteria
max_iteration = 60;
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
Fitness = Crossover (Fitness);

% Mutation

Fitness = Mutation(Fitness);

Eval_Fitness=Fitness;
for ii = 1:Population_number
    x=[Eval_Fitness(ii,1),Eval_Fitness(ii,2),Eval_Fitness(ii,3),Eval_Fitness(ii,4)];
    Eval_Fitness(ii,5) = NPV_4_var(x); 
end
Fitness=Eval_Fitness;

generation(Population_number*(attempt-1)+1:Population_number*attempt,(total_Optimization_number-1)*5+1:(total_Optimization_number)*5)=Eval_Fitness;
Best_Fitness(attempt,total_Optimization_number)=max(Fitness(:,5));
Ave_Fitness(attempt,total_Optimization_number)=mean(Fitness(:,5));
plot(attempt,Best_Fitness(attempt,total_Optimization_number),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness(attempt,total_Optimization_number),'k.','markersize',5);
hold on;
title('NPV_Optimization_Openings');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');

if attempt == 50
       stop_criteria = Best_Fitness(attempt,total_Optimization_number);
end
    if attempt == max_iteration 
    tolerance = abs(stop_criteria - Best_Fitness(attempt-10:attempt,total_Optimization_number));
    Tol_Fitness=sum(tolerance);
    if Tol_Fitness < 1E-3
        Best=Best_Fitness(attempt,total_Optimization_number);
        for ii=1:size(Fitness,1)
        if Fitness(ii,5) == Best
        NPV_BEST = Fitness(ii,5);
        WATER_DRAINAGE_WELL_COMPLETION=Fitness(ii,4); 
        DISTANCE_TOP_WATER_DRAINAGE_TO_WOC=Fitness(ii,3);
        OIL_WELL_COMPLETION=Fitness(ii,2);
        WATER_LIQUID_rate=Fitness(ii,1);
        X_Coarse= [WATER_LIQUID_rate , OIL_WELL_COMPLETION , DISTANCE_TOP_WATER_DRAINAGE_TO_WOC , WATER_DRAINAGE_WELL_COMPLETION];
        end
        end
        break;
    else
        max_iteration=max_iteration+5;
        stop_criteria=Best_Fitness(max_iteration-5,total_Optimization_number);
    end
    end
attempt=attempt+1;
fclose all;
end



                   %Water Drainage Rate Optimization
                      
% Initialization
attempt=1;
attempt2=1;

Opening_Optimized(Optimization_count,1:3)=[OIL_WELL_COMPLETION,DISTANCE_TOP_WATER_DRAINAGE_TO_WOC,WATER_DRAINAGE_WELL_COMPLETION];
Opening_Optimized(Optimization_count,4)=Best;

Fitness(1,1)=WATER_LIQUID_rate;
Fitness(1,2)=OIL_WELL_COMPLETION;
Fitness(1,3)=DISTANCE_TOP_WATER_DRAINAGE_TO_WOC;
Fitness(1,4)=WATER_DRAINAGE_WELL_COMPLETION;
x=[WATER_LIQUID_rate , OIL_WELL_COMPLETION , DISTANCE_TOP_WATER_DRAINAGE_TO_WOC , WATER_DRAINAGE_WELL_COMPLETION  ];
Fitness(1,5)=NPV_4_var(x);

    for ii=2:Population_number
        Fitness(ii,1)=(WATER_LIQUID_rate_Bound(2)-WATER_LIQUID_rate_Bound(1))*rand()+WATER_LIQUID_rate_Bound(1);
        Fitness(ii,2:4)=x(2:4);
        x2=Fitness(ii,1:4);
        Fitness(ii,5)=NPV_4_var(x2);
    end
Best_Fitness_Water(attempt,total_Optimization_number)=max(Fitness(:,5));
Ave_Fitness_Water(attempt,total_Optimization_number)=mean(Fitness(:,5));
generation_Water(Population_number*(attempt-1)+1:Population_number*attempt,(total_Optimization_number-1)*5+1:(total_Optimization_number)*5)=Fitness;
close all;
plot(attempt,Best_Fitness_Water(attempt,total_Optimization_number),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness_Water(attempt,total_Optimization_number),'k.','markersize',5);
hold on;
title('NPV_Optimization_Water Drainage Rate');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');
attempt=attempt+1;
% Stopping Criteria
max_iteration = 60;
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
% Crossover
%{
Crossover_rate=0.6;
while (1)
    temp=1;
    Fitness_Crossed=Fitness;
for ii=1:Population_number
    if ii==1
       random_Crossover(ii)=10;
    else
    random_Crossover(ii)=rand();
    end
    if random_Crossover(ii) < Crossover_rate
        CrossoverChoromosome(temp) = ii;
        temp=temp+1;
    end
end
if temp > 2
for ii=1:length(CrossoverChoromosome)
    Crossover_Point = round((VariableNumber - 2)*rand()+1);
    if ii == length(CrossoverChoromosome)
        Fitness_Crossed(CrossoverChoromosome(ii),:) = [Fitness(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness(CrossoverChoromosome(1),Crossover_Point+1:VariableNumber)];
    else
       Fitness_Crossed(CrossoverChoromosome(ii),:) = [Fitness(CrossoverChoromosome(ii),1:Crossover_Point) , Fitness(CrossoverChoromosome(ii+1),Crossover_Point+1:VariableNumber)];
    end
end
end
a1=(Fitness_Crossed(:,4) >= Fitness_Crossed(:,3));
a2=((Fitness_Crossed(:,4) +(Fitness_Crossed(:,4) - Fitness_Crossed(:,3))+200) <= 15550);
a3=sum(a1)+sum(a2);
if a3 == 12
    for ii=1:length(CrossoverChoromosome)
    Fitness(CrossoverChoromosome(ii),:)=Fitness_Crossed(CrossoverChoromosome(ii),:);
    end
    break;
end
end
%}

% Mutation
Mutationrate=0.4;
count=1;
Mutationrandom=zeros(1,(Population_number-1)*(VariableNumber-3));
for ii = 1:(Population_number-1)*(VariableNumber-3)
    Mutationrandom(ii) = rand();
    if Mutationrandom(ii) < Mutationrate 
        Muted_Choromosome(count) = ii;
        count = count + 1;
    end
end

    Fitness_Muted=Fitness(2:Population_number,1);
for ii=1:count-1
    Fitness_Muted(Muted_Choromosome(ii)) = (WATER_LIQUID_rate_Bound(2)-WATER_LIQUID_rate_Bound(1))*rand()+WATER_LIQUID_rate_Bound(1);
end

Fitness(2:Population_number,1) = Fitness_Muted;
clear Muted_Choromosome Fitness_Muted
Eval_Fitness=Fitness;
for ii = 1:Population_number
    x=[Eval_Fitness(ii,1),Eval_Fitness(ii,2),Eval_Fitness(ii,3),Eval_Fitness(ii,4)];
    Eval_Fitness(ii,5) = NPV_4_var(x); 
end
Fitness=Eval_Fitness;
   
generation_Water(Population_number*(attempt-1)+1:Population_number*attempt,(total_Optimization_number-1)*5+1:(total_Optimization_number)*5)=Eval_Fitness;
Best_Fitness_Water(attempt,total_Optimization_number)=max(Fitness(:,5));
Ave_Fitness_Water(attempt,total_Optimization_number)=mean(Fitness(:,5));
plot(attempt,Best_Fitness_Water(attempt,total_Optimization_number),'b.','markersize',5);
hold on;
plot(attempt,Ave_Fitness_Water(attempt,total_Optimization_number),'k.','markersize',5);
hold on;
title('NPV_Optimization_Water Drainage Rate');
legend('Best','Ave');
xlabel('Generation');
ylabel('NPV[$]');

if attempt == 50
       stop_criteria = Best_Fitness_Water(attempt,total_Optimization_number);
end
    if attempt == max_iteration
    tolerance = abs(stop_criteria - Best_Fitness_Water(attempt-10:attempt,total_Optimization_number));
    Tol_Fitness=sum(tolerance);
    if Tol_Fitness < 1E-3
        Best=Best_Fitness_Water(attempt,total_Optimization_number);
        for ii=1:size(Fitness,1)
        if Fitness(ii,5) == Best
        NPV_BEST = Fitness(ii,5);
        WATER_DRAINAGE_WELL_COMPLETION=Fitness(ii,4); 
        DISTANCE_TOP_WATER_DRAINAGE_TO_WOC=Fitness(ii,3);
        OIL_WELL_COMPLETION=Fitness(ii,2);
        WATER_LIQUID_rate=Fitness(ii,1);
        X_Coarse= [WATER_LIQUID_rate , OIL_WELL_COMPLETION , DISTANCE_TOP_WATER_DRAINAGE_TO_WOC , WATER_DRAINAGE_WELL_COMPLETION];
        end
        end
        break;
    else
        max_iteration=max_iteration+5;
        stop_criteria=Best_Fitness_Water(max_iteration-5,total_Optimization_number);
    end
    end
attempt=attempt+1;
fclose all;
end

Water_Drainage_Optimized(Optimization_count,1) = WATER_LIQUID_rate;
Water_Drainage_Optimized(Optimization_count,2) = Best;
optimizationvalues(total_Optimization_number,1:4)=[Water_Drainage_Optimized(Optimization_count,1) , Opening_Optimized(Optimization_count,1:3) ];
xlswrite('Test',optimizationvalues(total_Optimization_number,1:4),xlrange(total_Optimization_number,:));
if Optimization_count >= 2
    if Water_Drainage_Optimized(Optimization_count-1,1) == Water_Drainage_Optimized(Optimization_count,1) && Opening_Optimized(Optimization_count-1,1) == Opening_Optimized(Optimization_count,1) && Opening_Optimized(Optimization_count-1,2) == Opening_Optimized(Optimization_count,2) && Opening_Optimized(Optimization_count-1,3) == Opening_Optimized(Optimization_count,3)  
        break;
    end 
end
Optimization_count=1+Optimization_count;
General_Optimization(total_Optimization_number,1:4)=[WATER_LIQUID_rate,OIL_WELL_COMPLETION,DISTANCE_TOP_WATER_DRAINAGE_TO_WOC,WATER_DRAINAGE_WELL_COMPLETION];
total_Optimization_number = total_Optimization_number + 1;
end



