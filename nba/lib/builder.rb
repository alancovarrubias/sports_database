require 'csv'
class Builder
  def initialize(year)
    @year = year
  end

  def build_all
    seasons
    teams
  end

  def season
    @season ||= Season.find_or_create_by(year: @year)
  end

  def teams
    get_data_attributes(:teams, season: season) do |attributes|
      Team.find_or_create_by(attributes)
    end
  end

  def players
    season.teams.each do |team|
      get_data_attributes(:players, season: season, team: team) do |attributes|
        Player.find_or_create_by(attributes)
      end
    end
  end

  def games
    get_data_attributes(:games, season: season) do |attributes|
      attributes[:game_day] = GameDay.find_or_create_by(season: attributes[:season], date: attributes.delete(:date))
       Game.find_or_create_by(attributes)
    end
  end

  def stats
    season.games.each do |game|
      get_data_attributes(:stats, season: season, game: game) do |attributes|
      end
    end
  end

  private

    def get_data_attributes(model, options={}, &block)
      model_data = ModelData.new(model, options)
      if model_data.files.all? { |file| File.exist?(file) }
        model_data.files.each do |file|
          CSV.foreach(file, headers: true) do |row|
            pp row
            yield RowMap.new(row, model_data.keys, model_data.key_options).attributes.merge(options)
          end
        end
      else
        system(model_data.command)
        get_data_attributes(model, options, &block)
      end
    end
end
