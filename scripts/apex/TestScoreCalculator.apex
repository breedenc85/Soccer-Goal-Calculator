// Create sample goals
List<Goal> goals = new List<Goal>{
    new Goal('Barcelona', 'Messi', 10),
    new Goal('Madrid', 'Mbappe', 25),
    new Goal('Barcelona', 'Messi', 30)
};

// Instantiate the calculator
SoccerGameScoreCalculator calculator = new SoccerGameScoreCalculator();

// Calculate the game result and store it in a variable
SoccerGameResult result = calculator.calculateGameResult(goals);

// Output the results to the debug log
System.debug('Goal Details: ' + result.goalDetails);
System.debug('Final Score: ' + result.goalsPerTeam);
System.debug(result.winner);
System.debug('Is Tie: ' + result.tie);

