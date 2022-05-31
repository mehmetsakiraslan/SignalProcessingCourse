 I = imread('image.jpeg');
 figure(1)
 imshow(I)
 title('RGB Image')
    
 I2 = rgb2gray(I);

 figure(2)
 imshow(I2)
 title('Gray Scale Image')

 % Salt&Pepper Noise
 sigma = 0.2;
 mean = 0.1;
 a = (mean + sigma*randn(1,1))*3e6; % Kac noktanin noise'dan etkilenecegini 
                                    % belirleyen Gauss dagilimi
 I3 = I2;
 for i = 1:a
    y = randi(1536,1);
    x = randi(2048,1);
    if mod(x,2) == 0
        I3(y,x) = 0;
    else
        I3(y,x) = 255;
    end 
 end
 figure(3)
 imshow(I3)
 title("Salt&Pepper Noise")

 % Gaussian Noise
 sigma2 = 0.5;
 mean2 = 0.1;
 a = (mean2 + sigma2*randn(1536,2048))*255;  
 a = uint8(a);
 
 I4 = a  + I2;
 
 figure(4)
 imshow(I4)
 title("Gaussian Noise")

 % Lowpass Filtering
 filter = 1/9.*[1, 1, 1; 1, 1, 1; 1, 1, 1]; % LPF

 I5 = conv2(I3, filter,'same');

 I5 = uint8(I5);

 figure(5)
 imshow(I5)
 title("LPF S&P Noise")


 I6 = conv2(I4, filter,'same');

 I6 = uint8(I6);

 figure(6)
 imshow(I6)
 title("LPF Gaussian Noise")

 % Laplacian Filtering
 filter = 1/18.*[1, 1, 1; 2, 2, 2; 3, 3, 3]; % LPF

 I7 = conv2(I3, filter,'same');

 I7 = uint8(I7);

 figure(7)
 imshow(I7)
 title("LaplacianF S&P Noise")

 I8 = conv2(I4, filter,'same');
 I8 = uint8(I8);

 figure(8)
 imshow(I8)
 title("LaplacianF Gaussian Noise")

 % Edge Detection in Filtered Images
 BW1 = edge(I5);

 figure(9)
 imshow(BW1)
 title("LPF S&P Noise")

 BW2 = edge(I6);

 figure(10)
 imshow(BW2)
 title("LPF Gaussian Noise")

 BW3 = edge(I7);

 figure(11)
 imshow(BW3)
 title("LaplacianF S&P Noise")

 BW4 = edge(I8);

 figure(12)
 imshow(BW4)
 title("LaplacianF Gaussian Noise")


 