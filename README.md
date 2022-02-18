# redesneurais

[https://regijs.github.io](https://regijs.github.io)

Files written in MATLAB to learn Neural Networks.

Files:

* ELM.m - [outELM] = ELM (neuronios,inTreino,outTreino,inTeste,outTeste,c) - my implementation of the Extreme Learning Machine.
* showimag.m - showimag(X,Yp) - mostra as imagens quadradas X(k,:) e l+1, onde l é tal que Yp(k,l) é máximo em Yp(k,:).
* mnist.mat - MATLAB file with P 1000x784 matrix (1000 images for training), T 1000x10 matrix (1000 classifications).
* Ptest 200x784 matrix (200 images for testing), Ttest 200x10 (200 classifications).
* Example:
* load("mnist.mat");
* Y=ELM (512,P,T,Ptest,Ttest);
* IND=randi(200,[1,9]); showimag(Ptest(IND,:),Y(IND,:))
