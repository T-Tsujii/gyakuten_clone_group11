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
end
