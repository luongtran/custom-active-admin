ActiveAdmin.register Packet do
  actions :all, :except => [:destroy, :new]
  #controller do
  #  def index
  #    render partial: "admin/packets/show"
  #  end
  #end

  index do
    @packets = Packet.select("id, name").where(:parent_id => nil).order("position DESC")
    render partial: "admin/packets/index", :locals => {:packets => @packets}
  end

  sidebar "Informations" do
    ul do
      "Total packets: " + Packet.all.count.to_s
    end
  end

  filter :name
end