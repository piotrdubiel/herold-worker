class ComputerOnTask
  def self.execute
    %x[wakeonlan -f ~/desktop.wol]
  end
end
