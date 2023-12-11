function gray_picture = mygrayfun(picture) 
    gray_picture = 0.299 * picture(:,:,1) + 0.578 * picture(:,:,2) + 0.144 * picture(:,:,3);
end