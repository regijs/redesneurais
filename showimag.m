function showimag(X,Yp)  
%showimag(X,Yp) mostra as imagens quadradas X(k,:) e 
% l+1, onde l é tal que Yp(k,l) é máximo.
% Adequado para um um subconjunto de imagens do conjunto MNIST
%Exemplo: IND=randi(200,[1,9]); showimag(Ptest(IND,:),Y(IND,:))
%Para Y obtido de 
%load("mnist.mat"); Y=ELM (512,P,T,Ptest,Ttest);
%
%
%written by Reginaldo J. Santos - DMat-ICEx-UFMG - 15 February 2022
%
%
X=1-X';
clf
[mm,nn]=size(X);
m=sqrt(mm);
nl=ceil(nn/3);
nc=3;

caxis([0,1]);

colormap('gray');
if nn < nc
   for j=1:nn
     subplot(1,nn,j);
     image(reshape(X(:,j),m,m),'CDataMapping','scaled');
     axis('image');
     axis('off');
     [prob, ind_predito] = max(Yp(j,:), [], 2);
     title(['Prev. ',num2str(ind_predito-1), ' (',num2str(prob,2),')']);
%     xlabel(['com probabilidade ',num2str(prob,2)]);
   end
else
 for i=1:nl
   for j=1:nc
      n=(i-1)*nc+j;
      subplot(nl,nc,n);
      image(reshape(X(:,n),m,m),'CDataMapping','scaled');
      axis('image');
      axis('off');
      [prob ind_predito] = max(Yp(n,:), [], 2);
      title(['Prev. ',num2str(ind_predito-1),' (',num2str(prob,2),')']);
%      xlabel(['com probabilidade ',num2str(prob,2)]);
      if n == nn
         break;
      end
   end
 end
end


