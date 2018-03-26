function Denoising()

meanfilter();
medianfilter();
gaussian();


end


%Mean Filter
function meanfilter()
    S = imread('chelsea.jpg');
    I=S;
   
    R = S;
    [row, col] = size(S);
    
   S = imnoise(S, 'salt & pepper', 0.01);
    
    for i = 1:row-2
       for j = 1:col-2
           
           N = S(i:i+2, j:j+2);
           t = mean(N(:));
       
           
           R(i+1,j+1) = t;
         
                 
                 
             end
         end
        figure; 
   subplot(1,3,1);
   imshow(I);  
   title('input image');
   subplot(1,3,2);
   imshow(S);   
    title('input image with noise');
  
    subplot(1,3,3);
   imshow(R);
    title('input image with mean filter');
  
end
%Median Filter
function medianfilter()

  S = imread('chelsea.jpg');
    I=S;
   
   
   
    
   S = imnoise(S, 'salt & pepper', 0.01);
   Med=medfilt2(S);
   
    figure; 
   subplot(1,3,1);
   imshow(I);  
   title('input image');
   subplot(1,3,2);
   imshow(S);   
    title('input image with noise');
  
    subplot(1,3,3);
   imshow(Med);
    title('input image with median filter');

end
function gaussian()
I=im2double(imread('chelsea.jpg'));
S=imnoise(I,'gaussian',.01);
%standard deviation sigma
sigma=3;
cutoff=ceil(3*sigma);
R=fspecial('gaussian',2*cutoff+1,sigma);
R1=conv2(I,R,'same');
R2=conv2(S,R,'same');


figure;

subplot(1,4,1);
imshow(I);
title('Input Image');
subplot(1,4,2);
imshow(S);

title('Adding Noise to Input Image');
subplot(1,4,3);
imshow(R1);

title('Blurred input image using low-pass filter ');
subplot(1,4,4);
imshow(R2);

title('Blurred noisy image  ');




end
