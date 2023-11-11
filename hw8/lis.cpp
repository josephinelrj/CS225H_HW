#include <vector>
#include <algorithm>
#include <climits>
#include <chrono>
#include <iostream>
#include <random>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cmath>

int lis_recursive(const std::vector<int>& arr, int n) {
    if (n == 1)
        return 1;

    int max_length = 1;
    for (int i = 0; i < n - 1; i++) {
        int subproblem_length = lis_recursive(arr, i);
        if (arr[i] < arr[n - 1] && subproblem_length + 1 > max_length) {
            max_length = subproblem_length + 1;
        }
    }
    return max_length;
}

int lis_dp(const std::vector<int>& arr) {
    int n = arr.size();
    if (n == 0)
        return 0;

    std::vector<int> dp(n, 1);

    for (int i = 1; i < n; i++) {
        for (int j = 0; j < i; j++) {
            if (arr[i] > arr[j] && dp[i] < dp[j] + 1) {
                dp[i] = dp[j] + 1;
            }
        }
    }

    return *std::max_element(dp.begin(), dp.end());
}

int main(int argc, char **argv) {
    if(argc != 2) {
        std::cout << "random: must specify number" << std::endl;
        return (404);
    }
    int number = atoi(argv[1]);

    std::random_device rd;  
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> randint(1, 1000);

    std::vector<int> v1;
    for(int i = 0; i < number; ++i){    
        int num =  randint(gen);
        v1.push_back(num);
    }
    std::vector<int> v2 = v1;

    auto start_recursive = std::chrono::high_resolution_clock::now();
    int result_recursive = lis_recursive(v1, v1.size());
    auto end_recursive = std::chrono::high_resolution_clock::now();

    auto duration_recursive = std::chrono::duration_cast<std::chrono::nanoseconds>(end_recursive - start_recursive);
    std::cout << "Time taken by recursive approach: " << duration_recursive.count() << " nanoseconds" << std::endl;

    auto start_dp = std::chrono::high_resolution_clock::now();
    int result_dp = lis_dp(v2);
    auto end_dp = std::chrono::high_resolution_clock::now();

    auto duration_dp = std::chrono::duration_cast<std::chrono::nanoseconds>(end_dp - start_dp);
    std::cout << "Time taken by dynamic programming approach: " << duration_dp.count() << " nanoseconds" << std::endl;

    return 0;
}
