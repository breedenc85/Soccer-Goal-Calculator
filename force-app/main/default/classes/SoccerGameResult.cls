public with sharing class SoccerGameResult {
    public List<String> goalDetails = new List<String>();

    public Map<String,Integer> goalsPerTeam = new Map<String,Integer>();

    public String winner;

    public Boolean tie;

    public SoccerGameResult(List<String> goalDetails, Map<String,Integer> goalsPerTeam, String winner, Boolean tie){
        this.goalDetails = goalDetails;
        this.goalsPerTeam = goalsPerTeam;
        this.winner = winner;
        this.tie = tie;
    }
}