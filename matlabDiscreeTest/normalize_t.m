%@author Tiffany Jann
%@date August 13, 2017
%@contact jann.tiffany@gmail.com

%%%%% THIS IS A HELPER FUNCTION FOR MAIN SCRIPTS

function normalized_test_data = normalize_t(test_data)
normalized_test_data = ( test_data - ones(size(test_data)) * min(min(test_data)) ) / (max(max(test_data)) - min(min(test_data)));