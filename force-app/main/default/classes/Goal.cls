public with sharing class Goal {
    String teamName;
    String playerName;
    Integer goalTime;

    public Goal(String teamName, String playerName, Integer goalTime) {
        this.teamName = teamName;
        this.playerName = playerName;
        this.goalTime = goalTime;
    }

    public String getTeamName() {
        return teamName;
    }

    public String getPlayerName() {
        return playerName;
    }

    public Integer getGoalTime() {
        return goalTime;
    }
}