public with sharing class GoalTriggerHandler {
//     public GoalTriggerHandler() {

//     }

//     public void GoalAfterInsert(List<Goal> goals) {
//         Set<String> uniqueTeamNames = new Set<String>();
//         for(Goal goal : goals) {
//             String playerName = goal.getPlayerName();
//             String teamName = goal.getTeamName();
//             Integer goalTime = goal.getGoalTime();

//             System.debug('Player: ' + playerName + ', Team: ' + teamName + ', + GoalTime: ' + goalTime);

//             if (teamName != null) {
//                 uniqueTeamNames.add(teamName);
//             }
//         }

//         List<Team__c> teamsToUpdate = [
//                     SELECT 
//                         ID,
//                         Goal_Count__c,
//                         Name
//                     FROM Team__c
//                     WHERE Name IN :uniqueTeamNames
//         ];

//         List<Team__c> updatedTeams = new List<Team__c>();

//         for(Team__c team : teamsToUpdate) {
//             Integer totalGoals = 0;

//             for(Goal goal : goals) {
//                 if(goal.getTeamName() == team.Name) {
//                     totalGoals++;
//                 }
//             }

//             team.Goal_Count__c = totalGoals;
//             updatedTeams.add(team);
//         }
//         if(!updatedTeams.isEmpty()) {
//             update updatedTeams;
//         }
//     }

    public void GoalAfterUpdate(List<Goal__c> goals) {
        Set<Id> matchIds = new Set<Id>();
        for(Goal__c goal : goals) {
            matches.add(goal.Match__c);
        }
        List<Match__c> matches = 
        [SELECT Id, Team_1__c, Team_2__c, Score_1__c, Score_2__c,
            (SELECT Id, Player__c, Team__c, Goal_Time__c FROM Goals__r)
            FROM Match__c 
            WHERE Id IN :matchIds
        ];
        for(Match__c match: matches) {
            List<Goal> goalList = new List<Goal>();
            for(Goal__c goalRecord: match.Goals__r) {
                Goal goal = new Goal(
                    goalRecord.Team_Name__c,
                    goalRecord.Player_Name__c,
                    goalRecord.Goal_Time__c
                );
                goalList.add(goal);
            }
            SoccerGameScoreCalculator calculator = new SoccerGameScoreCalculator();
            SoccerGameResult result = calculator.calculateGameResult(goalList);
            match.Score_1__c = result.goalsPerTeam.get(match.Team_1__c);
            match.Score_2__c = result.goalsPerTeam.get(match.Team_2__c);
            match.Winner__c = result.winner;
        }
        update matches;
    }
}