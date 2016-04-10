class SearchParkingController < ApplicationController
  before_filter :authenticate_user!
  layout "home"
  
  def index
    @reservation_types = ReservationType.all
    @districts = District.all
  end
  
  def list_favorite
    @favorites = Favorite.where(user:current_user.id)
    #@favorites = Favorite.all
  end
  
  def list_park
    @some_parameter = params[:some_parameter]
    # do something with some_parameter and return the results
  
    #@parks=CarPark.all
    #@parks = CarPark.joins(:district)
    @conditions='state = 1';
    
    if params[:district] != ''
      @conditions += " AND district_id="+params[:district]
    end
    
    if params[:reservation_type] !=''
      @conditions += " AND reservation_type_id="+params[:reservation_type]
    end
    if params[:started_at] !=''
      @conditions += " AND started_at='"+params[:started_at]+"'"
    end
    if params[:ended_at] !=''
      @conditions += " AND ended_at='"+params[:ended_at]+"'"
    end
    if params[:started_time] !=''
      @conditions += " AND started_time='"+params[:started_time]+"'"
    end
    if params[:ended_time] !=''
      @conditions += " AND ended_time='"+params[:ended_time]+"'"
    end
    
    @parks = CarPark.includes(:district).where(@conditions)
    
    respond_to do |format|
      format.html
      #format.json {render json: @parks}
      format.json {render json: @parks.to_json(include: :district)}
    end
  end
  
  def reserve
    #Obtenemos datos del parqueo
    @car_park = CarPark.find_by(id: params[:id])
    
    
    #insertamos reservaciones
    @reservation = Reservation.new
    @reservation.car_park_id=params[:id]
    @reservation.user_id=current_user.id
    @reservation.code= 'R00000000'+params[:id]
    @reservation.started_at= @car_park.started_at
    @reservation.ended_at= @car_park.started_at
    @reservation.started_time= @car_park.started_time
    @reservation.ended_time= @car_park.ended_time
    @reservation.reservation_type_id= @car_park.reservation_type_id
    @reservation.save
    
    #actualizamos el estado de car_park
    CarPark.where( id: params[:id] ).update_all(state:0)
    
    #INSERTAMOS FAVORITOS
    #preguntamos si ya existe favorito para el usuario logueado, si existe ya no guandamos
    @favorite = Favorite.where(district_id: @car_park.district.id,user_id: current_user.id);
      
    if @favorite
    else
      @insert_favorite = Favorite.new
      @insert_favorite.name = "Favorito "+params[:id]
      @insert_favorite.user_id = current_user.id
      @insert_favorite.district_id = @car_park.district.id
      @insert_favorite.save
    end
      
    #RESPUESTA
    @code_respuesta = params[:id];
    
    
    
    respond_to do |format|
      format.html
      format.json {render json: @code_respuesta}
    end
  end
  
end
