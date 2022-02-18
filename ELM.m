function [outELM] = ELM (neuronios,inTreino,outTreino,inTeste,outTeste,c)
%[outELM] = ELM (neuronios,inTreino,outTreino,inTeste,outTeste)
%[outELM] = ELM (neuronios,inTreino,outTreino,inTeste,outTeste,c) com
%parâmetro de regularização c.

%    size(inTxxx,2) = no. de dados das amostras
%    size(inTreino,1) = no. de amostras de treinamento
%    size(outTxxx,2) = no. de classes das amostras
%    size(outTreino,1) = size(inTreino,1)
    
    disp(['No. de amostras de treinamento = ',num2str(size(inTreino,1))]);
    disp(['No. de amostras de teste = ',num2str(size(inTeste,1))]);
    disp(['No. de classes = ',num2str(size(outTreino,2))]);
    if nargin==5
        c=0;
    end
    inTreino = [inTreino ones(size(inTreino,1),1)]; % adiciona uma coluna de 1's pra multiplicar pelo bias    
    inTeste = [inTeste ones(size(inTeste,1),1)]; % adiciona uma coluna de 1's pra multiplicar pelo bias 
    
    % Treinamento
    % 
    W = 2*rand([size(inTreino,2) neuronios])-1; %ultima linha corresponde ao bias da camada escondida 
    
%    tic
    H = 1 ./ (1 + exp(-inTreino*W));
%   Beta é tal que  (||H*Beta-outTreino||+c||Beta||) é mínimo
    if size(inTreino,1) >= size(H,2)
        Beta = ( H'  *  H + c * eye(size(H,2)) ) \ ( H'  *  outTreino);
    else
        Beta = (H'/(H  *  H' + c * eye(size(H,1)) )) * outTreino;
    end
%    toc

    % Teste

    H = 1 ./ (1 + exp(-inTeste*W));
    outELM = H * Beta;
end
