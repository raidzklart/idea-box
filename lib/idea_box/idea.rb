require 'time'
class Idea
  include Comparable
  attr_reader :title, :description, :rank, :id, :created_at
  def initialize(attributes)
    @title = attributes["title"]
    @description = attributes["description"]
    @rank = attributes["rank"] || 0
    @id = attributes["id"]
    @created_at = Time.now.strftime('%a_%d/%m/%Y:%H:%M:%S')
  end

  def save
    IdeaStore.create(to_h)
  end

  def like!
    @rank += 1
  end

  def to_h
    {
      "title" => title,
      "description" => description,
      "rank" => rank,
      "created_at" => created_at
    }
  end

  def <=>(other)
    other.rank <=> rank
  end
end