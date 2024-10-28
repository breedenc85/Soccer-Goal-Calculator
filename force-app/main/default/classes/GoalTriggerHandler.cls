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

//     public void GoalAfterUpdate(List<Goal__c> goals) {
//         Set<String> uniqueTeamNames = new Set<String>();
//         for(Goal__c goal : goals) {
//             String playerName = goal.getPlayerName();
//             String teamName = goal.getTeamName();
//             Integer goalTime = goal.getGoalTime();

//             uniqueTeamNames.add(teamName);

//             System.debug('Player: ' + playerName + ', Team: ' + teamName + ', GoalTime: ' + goalTime);
//         }

//         for(Integer i = 0; i < goals.size(); i++) {
//             Goal__c newGoal = goals[i];
//             Goal__c oldGoal = (Goal__c)Trigger.old[i];

//             if (newGoal.getTeamName() != oldGoal.getTeamName() ||
//                 newGoal.getGoalTime() != oldGoal.getGoalTime()) {
                
//                 List<Team__c> teamsToUpdate = new List<String>();
                
//                 if(newGoal.getTeamName() != oldGoal.getTeamName()) {
//                     String oldTeamName = oldGoal.getTeamName();
//                     String newTeamName = newGoal.getTeamName();

//                     Team__c oldTeam = [
//                             SELECT 
//                                 ID,
//                                 Goal_Count__c
//                             FROM Team__c 
//                             WHERE Team_Name__c = : oldTeamName LIMIT 1
//                     ];
//                     oldTeam.Goal_Count_c--;
//                     teamsToUpdate.add(oldTeam); 

//                     Team__c newTeam = [
//                             SELECT 
//                                 ID,
//                                 Goal_Count__c
//                             FROM Team 
//                             WHERE Team_Name__c = : newTeamName LIMIT 1
//                     ];
//                     newTeam.Goal_Count_c++;
//                     teamsToUpdate.add(newTeam);
//                 }

//                 if(newGoal.getTeamName() == oldGoal.getTeamName() && 
//                     newGoal.getGoalTime() != oldGoal.getGoalTime()) {
                    
//                     Integer newGoalTime = newGoal.getGoalTime();
//                 }
//             }
//         }
//     }
}