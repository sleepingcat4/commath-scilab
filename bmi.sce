function bmi = calculate_bmi(weight, height)
    // Convert height from centimeters to meters
    height_meters = height / 100;

    // Calculate BMI
    bmi = weight / (height_meters^2);
endfunction

// Example usage:
weight_kg = 70;    // Replace with your weight in kilograms
height_cm = 170;   // Replace with your height in centimeters

bmi_result = calculate_bmi(weight_kg, height_cm);
disp("Your BMI is: " + string(bmi_result));
