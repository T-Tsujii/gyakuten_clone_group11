require 'csv'

namespace :import_csv do
  desc "AWS記事のCSVデータをインポートするタスク"
  task aws_texts: :environment do
    path = File.join Rails.root, "db/csv_data/aws_text_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row["title"],
          content: row["content"]
      }
    end
    puts "インポート処理を開始".red

    begin
      AwsText.transaction do
        AwsText.create!(list)
      end
      puts "インポート完了!!".green
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError".red
    end
  end

  desc "質問のCSVデータをインポートするタスク"
  task questions: :environment do
    path = File.join Rails.root, "db/csv_data/question_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row["title"],
          detail: row["detail"]
      }
    end
    puts "インポート処理を開始".red

    begin
      Question.transaction do
        Question.create!(list)
      end
      puts "インポート完了!!".green
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError".red
    end
  end

  desc "動画のCSVデータをインポートするタスク"
  task movies: :environment do
    path = File.join Rails.root, "db/csv_data/movie_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
          title: row["title"],
          url: row["url"]
      }
    end
    puts "インポート処理を開始".red

    begin
      Movie.transaction do
        Movie.create!(list)
      end
      puts "インポート完了".green

    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError".red
    end
  end
end
