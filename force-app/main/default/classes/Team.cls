public with sharing class Team {
    String teamName;
    Integer goalCount = 0;
    List<Goal> goalList = new List<Goal>();

    public Team(String teamName) {
        this.teamName = teamName;
        this.goalCount = 0;
    }

    public void addGoal(Goal goal) {
        goalList.add(goal);
        goalCount ++;
    }

    public Integer getGoalCount() {
        return goalCount;
    }

    public String getTeamName() {
        return teamName;
    }
}