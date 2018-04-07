function problem = setProblemParameters(problem, N, Gmax)
    problem.N = N;
    problem.Gmax = Gmax;

    switch(func2str(problem.fitnessFunction))
        case "schaffer"
            problem.lower = [-1000];
            problem.upper = [1000];
            problem.L = 1;
            A = linspace(0,2,500);
            problem.pareto = A(:);
            problem.alias = @SCH;
        case "fonseca"
            problem.lower = [-4,-4,-4];
            problem.upper = [4,4,4];
            problem.L = 3;
            A = linspace((-1/sqrt(3)),(1/sqrt(3)),500);
            problem.pareto = [A(:), A(:), A(:)];
            problem.alias = @FON;
        case "poloni"
            problem.lower = [-pi, -pi];
            problem.upper = [pi, pi];
            problem.L = 2;
            problem.pareto = 0;
            problem.alias = @POL;
        case "kursawe"
            problem.lower = [-5, -5, -5];
            problem.upper = [5, 5, 5];
            problem.L = 3;
            problem.pareto = 0;
            problem.alias = @KUR;
        case {"zdt1", "zdt2", "zdt3"}
            problem.lower = zeros(1,30);
            problem.upper = ones(1,30);
            problem.L = 30;
            A = linspace(0,1,500);
            B = zeros(length(A),problem.L);
            B(:,1) = A(:);
            problem.pareto = B;
            
            switch(func2str(problem.fitnessFunction))
                case "zdt1"
                    problem.alias = @ZDT1;
                case "zdt2"
                    problem.alias = @ZDT2;
                case "zdt3"
                    problem.alias = @ZDT3;
            end
        case "zdt4"
            problem.lower = [0, -5, -5, -5, -5, -5, -5, -5, -5, -5];
            problem.upper = [1, 5, 5, 5, 5, 5, 5, 5, 5, 5];
            problem.L = 10;
            A = linspace(0,1,500);
            B = zeros(length(A),problem.L);
            B(:,1) = A(:);
            problem.pareto = B;
            problem.alias = @ZDT4;
        case "zdt6" 
            problem.lower = zeros(1,10);
            problem.upper = ones(1,10);
            problem.L = 10;
            A = linspace(0,1,500);
            B = zeros(length(A),problem.L);
            B(:,1) = A(:);
            problem.pareto = B;
            problem.alias = @ZDT6;
    end
    
end

