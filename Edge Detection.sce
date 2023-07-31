// Load the scipad toolbox if not already loaded
if ~isloaded("scipad") then
    exec("ScipadLoader.sce");
end

// Read and display the original image
img = imread("F:\Scilab\WSS.jpg");
imshow(img);

// Convert the image to grayscale (required for edge detection)
gray_img = mss2gray(img);

// Apply the Sobel operator for edge detection
sobel_result = edge(gray_img, "Sobel");

// Display the edge magnitude image
imshow(sobel_result);
