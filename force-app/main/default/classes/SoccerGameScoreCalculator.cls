public with sharing class SoccerGameScoreCalculator {
    Map<String, Team> teams = new Map<String,Team>();

    public void calculateTotalScore(List<Goal> goals) {
        for(Integer i = 0; i < goals.size(); i++) {
            Goal goal = goals[i];
            String teamName = goal.getTeamName();

            if(!teams.containsKey(teamName)) {
                teams.put(teamName, new Team(teamName));
            }

            teams.get(teamName).addGoal(goal);
        }
    }

    public Map<String,Integer> getTotalGoals() {
        Map<String,Integer> totalGoals = new Map<String,Integer>();

        for(Team team : teams.values()) {
            totalGoals.put(team.getTeamName(), team.getGoalCount());
        }

        return totalGoals;
    }

    public MatchResult determineWinner() {
        Integer maxGoals = 0;
        List<Team> winningTeams = new List<Team>();

        for (Team team : teams.values()) {
            Integer teamGoals = team.getGoalCount();
            if (teamGoals > maxGoals) {
                maxGoals = teamGoals;
                winningTeams.clear();
                winningTeams.add(team);
            } else if (teamGoals == maxGoals) {
                winningTeams.add(team);
            }
        }

        return new MatchResult(winningTeams, maxGoals);
    }

    public SoccerGameResult calculateGameResult(List<Goal> goals) {
        calculateTotalScore(goals);
        MatchResult result = determineWinner();
        List<String> goalDetails = new List<String>();
        Map<String,Integer> totalGoals = getTotalGoals();

        for (Goal goal : goals) {
            goalDetails.add('Goal by ' + goal.getPlayerName() + ' for team ' + goal.getTeamName() + ' at ' + goal.getGoalTime() + ' minutes.');
        }
        return new SoccerGameResult(goalDetails, totalGoals, result.getWinner(), result.isTie());
    }
}
