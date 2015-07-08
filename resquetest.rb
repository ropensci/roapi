class Archive
  @queue = :file_serve

  def self.perform(repo_id, branch = 'master')
    repo = Repository.find(repo_id)
    repo.create_archive(branch)
  end
end

class Repository
  def async_create_archive(branch)
    Resque.enqueue(Archive, self.id, branch)
  end
end

klass, args = Resque.reserve(:file_serve)
klass.perform(*args) if klass.respond_to? :perform

# Archive.perform(44, 'masterbrew')
