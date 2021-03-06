module PreCommit
  class TabsCheck
    LEADING_TAB_PATTERN = '^ *\t'

    def self.call(staged_files)
      return if staged_files.empty?
      errors = `#{Utils.grep} '#{LEADING_TAB_PATTERN}' #{staged_files.join(" ")}`.strip
      return unless $?.success?
      "detected tab before initial space:\n#{errors}"
    end
  end
end
