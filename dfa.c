#include <stdio.h>
#include <string.h>

// Enumeration for DFA states
typedef enum { Q0, Q1, Q2, Q3 } State;

// Function to get the next state based on current state and input character
State getNextState(State currentState, char input) {
    switch (currentState) {
        case Q0:
            if (input == '0') return Q1; // Even 0s, even 1s -> Odd 0s, even 1s
            if (input == '1') return Q2; // Even 0s, even 1s -> Even 0s, odd 1s
            break;
        case Q1:
            if (input == '0') return Q0; // Odd 0s, even 1s -> Even 0s, even 1s
            if (input == '1') return Q3; // Odd 0s, even 1s -> Odd 0s, odd 1s
            break;
        case Q2:
            if (input == '0') return Q3; // Even 0s, odd 1s -> Odd 0s, odd 1s
            if (input == '1') return Q0; // Even 0s, odd 1s -> Even 0s, even 1s
            break;
        case Q3:
            if (input == '0') return Q2; // Odd 0s, odd 1s -> Even 0s, odd 1s
            if (input == '1') return Q1; // Odd 0s, odd 1s -> Odd 0s, even 1s
            break;
    }
    return Q0; // Default state, although input should be only '0' or '1'
}

// Function to check if the given string is accepted by the DFA
int isAcceptedByDFA(const char* input) {
    State currentState = Q0; // Start at the initial state Q0

    // Process each character in the input string
    for (int i = 0; i < strlen(input); i++) {
        if (input[i] != '0' && input[i] != '1') {
            printf("Invalid character detected: %c\n", input[i]);
            return 0;
        }
        currentState = getNextState(currentState, input[i]);
    }

    // Check if the final state is the accepting state Q1
    return (currentState == Q1);
}

int main() {
    char input[100];

    printf("Enter a binary string: ");
    scanf("%s", input);

    // Check if the input string is accepted by the DFA
    if (isAcceptedByDFA(input)) {
        printf("The string is accepted by the DFA (odd number of 0s and even number of 1s).\n");
    } else {
        printf("The string is NOT accepted by the DFA.\n");
    }

    return 0;
}
