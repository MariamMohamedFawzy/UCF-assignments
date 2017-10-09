% write the kernels

average_kernel_3 =  ones(3) / 9;
average_kernel_5 = ones(5) / 25;

gaussian_kernel_1 = fspecial('gaussian', [3 3], 1);
gaussian_kernel_2 = fspecial('gaussian', [5 5], 2);
gaussian_kernel_3 = fspecial('gaussian', [7 7], 3);

sobel_kernel_y = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_kernel_x = [-1 0 1; -2 0 2; -1 0 1];

prewitt_kernel_y = [1 1 1;0 0 0; -1 -1 -1];
prewitt_kernel_x = [-1 0 1; -1 0 1; -1 0 1];


% % % % % % % % % % % % % 

%read the images

noisy_img_1 = imread('Noisyimage1.jpg');
noisy_img_2 = imread('Noisyimage2.jpg');

b1_img = imread('B1.jpg');
b2_img = imread('B2.jpg');

house1_img = imread('House1.jpg');
house2_img = imread('House2.jpg');

walk1_img = imread('walk_1.jpg');
walk2_img = imread('walk_2.jpg');

q3_img = imread('Q_3.jpg');

% % % % % % % % % % % % % % % % % % % % % % 

%Q2
noisy_img_1_gaussian_5 = myImageFilter(noisy_img_1, gaussian_kernel_3);
noisy_img_2_gaussian_5 = myImageFilter(noisy_img_2, gaussian_kernel_3);

noisy_img_1_med_filt = medfilt2(noisy_img_1);
noisy_img_2_med_filt = medfilt2(noisy_img_2);

figure;imshow(noisy_img_1); title('noisy_img_1');
figure;imshow(noisy_img_2); title('noisy_img_2');
figure;imshow(uint8(noisy_img_1_gaussian_5)); title('noisy_img_1_gaussian_5');
figure;imshow(uint8(noisy_img_2_gaussian_5)); title('noisy_img_2_gaussian_5');
figure;imshow(noisy_img_1_med_filt); title('noisy_img_1_med_filt');
figure;imshow(noisy_img_2_med_filt); title('noisy_img_2_med_filt');

% Median filter is better with salt and pepper noise as it removes it 
% while gaussian distributes the noise among neighbor pixels

% % % % % % % % % % % % % % % % % % % % % % % 

% Q3


[q_3_mag,q_3_dir] = imgradient(q3_img);
q_3_mag_norm = (q_3_mag - min(min(q_3_mag))) ./ (max(max(q_3_mag)) - min(min(q_3_mag)));
q_3_mag_norm = uint8(q_3_mag_norm .* 255);
q_3_dir_norm = (q_3_dir - min(min(q_3_dir))) ./ (max(max(q_3_dir)) - min(min(q_3_dir)));
q_3_dir_norm = uint8(q_3_dir_norm .* 255);

figure;imhist(q_3_mag_norm);
figure;imhist(q_3_dir_norm);

% % % % % % % % % % % % % % % % % % % % % 

% Q 4

figure;imshow(uint8(walk1_img - walk2_img));

% This shows people walking in image 1 and do not exist in image 2


% % % % % % % % % % % % % % % % 

% Q 5
BW1 = edge(q3_img,'canny', 0.9, 1);
BW2 = edge(q3_img,'canny', 0.1, 1);
BW3 = edge(q3_img,'canny', 0.5, 1);
BW4 = edge(q3_img,'canny', 0.9, 3);
BW5 = edge(q3_img,'canny', 0.1, 3);
BW6 = edge(q3_img,'canny', 0.5, 3);