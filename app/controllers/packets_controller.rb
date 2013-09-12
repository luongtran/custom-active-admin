class PacketsController < InheritedResources::Base

  #def index
  #  @packets = Packet.select("id, name,parent_id").all
  #  respond_to do |f|
  #    f.html
  #  end
  #end
  def create
    @packet = Packet.new(params[:packet])
    if @packet.save
      redirect_to @packet
    else
      render :edit
    end

  end
  def show
    @packet = Packet.find params[:id]
    @childrens = Packet.where(:parent_id => params[:id])
  end

  #== Get all root node
  #def roots
  #  @packets = Packet.select("id, name").where(:parent_id => nil)
  #  respond_to do |f|
  #    f.json { render :json => @packets.to_json } #(:include => {:children => {:only => [:id, :name]}})
  #  end
  #end
  def roots
    @packets = Packet.where(:id => params[:p_id])
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

  def reorder
    packets = Packet.select("id, name,position").where(:parent_id => nil).order("position DESC")
    new_order = params[:new_order].split(',')
    old_position = []
    packets.each do |a|
      old_position << [a.position]
    end
    new_order.each_with_index do |id, index|
      Packet.find(id).update_column('position', old_position[index])
    end
    render :nothing => true
  end
end
