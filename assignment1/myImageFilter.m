function [output_Image]= myImageFilter(Input_image, filter)
    output_Image = conv2(Input_image, filter, 'same');
end