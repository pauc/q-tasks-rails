module UserAndOwnerHelper
  def user
    @user ||= create(:user, team: team)
  end

  def team
    return @team if @team

    @team = create :team
  end
end
