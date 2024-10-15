public with sharing class MatchResult {
    List<Team> winningTeam = new List<Team>();
    Integer goalsScored;

    public MatchResult(List<Team> winningTeam, Integer goalsScored) {
        this.winningTeam = winningTeam;
        this.goalsScored = goalsScored;
    }

    public String getWinner() {
        if(winningTeam.size() == 1) {
            return 'Winner: ' + winningTeam[0].getTeamName();
        } else {
            return 'The game is a tie';
        }
    }

    public Boolean isTie() {
        return winningTeam.size() > 1;
    }
}