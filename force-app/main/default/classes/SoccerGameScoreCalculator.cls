public with sharing class SoccerGameScoreCalculator {
    public Map<String, Integer> teamGoals = new Map<String, Integer>();

    public void calculateTotalScore(List<String[]> goals) {
        //Loop through each goal entry
        for(Integer i = 0; i < goals.size(); i++) {
            String[] goal = goals[i];
            String teamName = goal[0];
            String playerName = goal[1];
            Integer goalTime = Integer.valueOf(goal[2]);
            
            //Check if team exists in map, if assign team and score
            if(!teamGoals.containsKey(teamName)) {
                teamGoals.put(teamName, 0);
            }

            //Increase team goal count
            teamGoals.put(teamName, teamGoals.get(teamName) + 1);

            //Get goal details
            getGoalDetails(teamName, playerName, goalTime);
        }

        //Get total goals for each team
        getTotalGoals();

        //Determine winner
        getWinner();

        }
        //Create method for getting goal details
        private void getGoalDetails(String teamName, String playerName, Integer goalTime) {
            System.debug('Goal scored by ' + playerName + ' of ' + teamName + ' at ' + goalTime + ' minutes.');
        }
        //Create method for getting total goals for each team
        private void getTotalGoals() {
            for (String team : teamGoals.keySet()) {
                System.debug(team + ' ' + teamGoals.get(team));
            }
        }
        //Create method to determine winner 
        private void getWinner() {
            List<String> winners = new List<String>();
            Integer maxGoals = 0;

            for (String team : teamGoals.keySet()) {
                Integer goals = teamGoals.get(team);
                if (goals > maxGoals) {
                    maxGoals = goals;
                    winners.clear();
                    winners.add(team);
                } else if (
                    goals == maxGoals) {
                        winners.add(team);
                    }
                }

            if (winners.size() == 1) {
                System.debug(winners[0]);
            } else {
                System.debug('The game was tied at ' + maxGoals);
            } 

        }
    }
