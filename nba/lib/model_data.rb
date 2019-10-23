class ModelData
  attr_reader :files, :command, :keys, :key_options
  def initialize(model, options)
    @database_root = "#{Rails.root}/lib/database"
    @files = get_files(model, options)
    @command = get_command(model, options)
    @keys = get_keys(model, options)
    @key_options = get_key_options(model, options)
  end

  private
    def get_command(model, options)
      case model
      when :teams
        return "python3 #{@database_root}/teams.py #{options[:season].year}"
      when :players
        return "python3 #{@database_root}/players.py #{options[:season].year} #{options[:team].abbr}"
      when :games
        return "python3 #{@database_root}/games.py #{options[:season].year}"
      when :stats
        return "python3 #{@database_root}/stats.py #{options[:game].date_str} #{options[:game].away_team.abbr} #{options[:game].home_team.abbr}"
      end
    end

    def get_keys(model, options)
      keys = {
        teams: [:name, :city, :abbr],
        players: [:name, :abbr],
        games: [:date, :away_team, :home_team],
        stats: [:abbr, :sp, :fg, :fga, :fg3, :fg3a, :ft, :fta, :orb, :drb, :ast, :stl, :tov, :pf],
      }
      return keys[model]
    end

    def get_key_options(model, options)
      keys = {
        teams: {},
        players: {},
        games: {
          date: { model: Date, map: "parse" },
          away_team: { model: Team, map: "find_by_name" },
          home_team: { model: Team, map: "find_by_name" },
        },
        stats: {},
      }
      return keys[model]
    end

    def get_files(model, options)
      case model
      when :teams
        files = ["teams/#{options[:season].year}.csv"]
      when :players
        files = ["players/#{options[:season].year}/#{options[:team].abbr}.csv"]
      when :games
        files = ["games/#{options[:season].year}.csv"]
      when :stats
        files = ["stats/#{options[:game].date_str}/#{options[:game].away_team.abbr}.csv", "stats/#{options[:game].date_str}/#{options[:game].home_team.abbr}.csv"]
      end
      return files.map { |file| File.join(@database_root, file) }
    end
end
