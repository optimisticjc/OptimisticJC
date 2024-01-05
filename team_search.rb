
def reconstruct_team input_data

    if input_data.length % 5000 == 0
      return "WARNING - the audit log contains an exact multiple of 5000 entries, so it is likely incomplete, as that's the maximum Stafftools can provide in one go."
    end
  
  
    chronological_data = input_data.reverse
    team_array = []
    repo_array = []
    permissions_array = []
  
    chronological_data.each do |entry|
      case entry[:action]
      when "team.add_member"
        team_array.push entry[:user]
        team_array.push entry[:permission]
      when "team.remove_member"
        team_array.delete entry[:user]
      when "team.add_repository"
        repo_array.push entry[:repo]
      when "team.remove_repository"
        repo_array.delete entry[:repo]
      else
        next
      end
    end
  
    return_results = "Team members:\n" + team_array.join("\n") + "\n\nRepositories\n" + repo_array.join("\n")
  
    return return_results
  
  end
  