function detected = Detect(idx)
    
    %This function take in an input index and matches it with a character
    switch idx
            case 1
                detected = '1';
            case 2
                detected = '2';
            case 3
                detected = '3';
            case 4
                detected = '4';
            case 5
                detected = '5';
            case 6
                detected = '6';
            case 7
                detected = '7';
            case 8
                detected = '8';
            case 9
                detected = '9';    
            case 10
                detected = '0';
            case 11
                detected = '.';
            case 12
                detected = '+';
            case 13
                detected = '-';
            case 14
                detected = '*';
            case 15
                detected = '/';
    end       
end