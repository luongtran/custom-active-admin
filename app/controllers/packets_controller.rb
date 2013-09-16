class PacketsController < InheritedResources::Base

  #def index
  #  @packets = Packet.select("id, name").all
  #  respond_to do |f|
  #    f.html
  #  end
  #end

  #== Get all root node
  def roots
    @packets = Packet.select("id, name").where(:parent_id => nil)
    respond_to do |f|
      f.json { render :json => @packets.to_json } #(:include => {:children => {:only => [:id, :name]}})
    end
  end

  def childrens_of
    @packets = Packet.where(:parent_id => params[:p_id])
    respond_to { |f| f.json { render :json => @packets.to_json } }
  end

  def packet_infor
    @packet = Packet.find params[:p_id]
    respond_to do |f|
      f.js { render :template => 'admin/packets/find_packet' }
    end
  end

  #def show
  #  @packet = Packet.find params[:id]
  #end
end
