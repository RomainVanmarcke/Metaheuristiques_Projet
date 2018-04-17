function problem = setProblemParameters(problem, N, Gmax, objNumber)
    problem.N = N;
    problem.Gmax = Gmax;
    problem.objNumber = objNumber;

    switch(func2str(problem.fitnessFunction))
        case "schaffer"
            problem.lower = [-1000];
            problem.upper = [1000];
            problem.L = 1;
            A = linspace(0,2,500);
            problem.pareto = A(:);
        case "fonseca"
            problem.lower = [-4,-4,-4];
            problem.upper = [4,4,4];
            problem.L = 3;
            A = linspace((-1/sqrt(3)),(1/sqrt(3)),500);
            problem.pareto = [A(:), A(:), A(:)];
        case "poloni"
            problem.lower = [-pi, -pi];
            problem.upper = [pi, pi];
            problem.L = 2;
            problem.pareto = 0;
        case "kursawe"
            problem.lower = [-5, -5, -5];
            problem.upper = [5, 5, 5];
            problem.L = 3;
            problem.pareto = 0;
        case {"zdt1", "zdt2", "zdt3"}
            problem.lower = zeros(1,30);
            problem.upper = ones(1,30);
            problem.L = 30;
            A = linspace(0,1,500);
            B = zeros(length(A),problem.L);
            B(:,1) = A(:);
            problem.pareto = B;
        case "zdt4"
            problem.lower = [0, -5, -5, -5, -5, -5, -5, -5, -5, -5];
            problem.upper = [1, 5, 5, 5, 5, 5, 5, 5, 5, 5];
            problem.L = 10;
            A = linspace(0,1,500);
            B = zeros(length(A),problem.L);
            B(:,1) = A(:);
            problem.pareto = B;
        case "zdt6" 
            problem.lower = zeros(1,10);
            problem.upper = ones(1,10);
            problem.L = 10;
            A = linspace(0,1,500);
            B = zeros(length(A),problem.L);
            B(:,1) = A(:);
            problem.pareto = B;
    end
    
end

